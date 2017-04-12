import sys
import pytz
import datetime
from pytz import timezone
from datetime import datetime as dt
from tzlocal import get_localzone

import json
import time
import pandas as pd
import threading
import sys
import logging
import time
#import websocket
import threading
import dateutil 
#lock = threading.Lock()
import socket   
sys.path.append("../../")
sys.path.append("../")

import os
#os.environ.setdefault("DJANGO_SETTINGS_MODULE", "beCOMPANY.settings")
#import beCOMPANY
#import beCOMPANY.settings as settings
from scripts.elasticmodel import *
from dateutil.parser import parse
#import psycopg2
import threading
from dateutil.relativedelta import relativedelta
import time
eastern=timezone('US/Eastern')
'''
try:
    dbstr="dbname=" + settings.DATABASES['default']['NAME'] + \
          " user=" + settings.DATABASES['default']['USER'] + \
          " password=" + settings.DATABASES['default']['PASSWORD'] + \
          " host=" + settings.DATABASES['default']['HOST'] + \
          " port=" + settings.DATABASES['default']['PORT']
          
    c=psycopg2.connect(dbstr)
except:
    print "I am unable to connect to the database."
''' 
Instrument.init()
Feed.init()
#Sequence.init()
logging.basicConfig(stream=sys.stdout,  level=logging.ERROR)
#logging.basicConfig(filename='/logs/get_hist.log',level=logging.DEBUG)

debug=False
last=dict()
feed={}
ohlc={}
hashist={}
model=pd.DataFrame()

'''
[Symbol] - Required - Max Length 30 characters.
[Interval] - Required - The interval in seconds.
[MaxDatapoints] - Required - The maximum number of datapoints to be retrieved.
[DataDirection] - Optional - '0' (default) for "newest to oldest" or '1' for "oldest to newest".
[RequestID] - Optional - Will be sent back at the start of each line of data returned for this request.
[DatapointsPerSend] - Optional - Specifies the number of datapoints that IQConnect.exe will queue before attempting to send across the socket to your app.
[IntervalType] - Optional - 's' (default) for time intervals in seconds, 'v' for volume intervals, 't' for tick intervals
'''
def get_hist(symbol, interval, maxdatapoints,datadirection=0,requestid='',datapointspersend='',intervaltype=''):
    #get_bitstampfeed()
    global feed
    global ohlc
    
    symbol=symbol.upper()
    instrument_list=Instrument.search().filter('match_phrase',sym=symbol).execute()
    if instrument_list and len(instrument_list) > 0:
        instrument=instrument_list[0]
    else:
        instrument=Instrument()
        instrument.sym=symbol
        instrument.save()
    
    #timenow=datetime.now() 
    #mykey = "%s|%s|%s" % (symbol, interval, maxdatapoints)
    #if not last.has_key(mykey) or last[mykey] < timenow - relativedelta(minutes=1):
    #    last[mykey]=timenow
    #    (symbol, interval, maxdatapoints)=mykey.split('|')
    #    threads = []
    #    feed_thread = threading.Thread(target=bg_get_hist, args=[instrument, symbol, interval, maxdatapoints,datadirection,requestid,datapointspersend,intervaltype])
    #    feed_thread.daemon=True
    #    threads.append(feed_thread)
    #    [t.start() for t in threads]
    #    [t.join() for t in threads]
    from pandas.io.json import json_normalize
    
    feed_list=Feed.search().filter('term',frequency=interval).filter('term',instrument_id=instrument.id).sort('-date')
    feed_list=feed_list[:int(maxdatapoints)]
    res=[]
    for feed in feed_list:
        quote={ 'Date':feed.date,
                                'Open':feed.open,
                                'High':feed.high,
                                'Low':feed.low,
                                'Close':feed.close,
                                'Volume':feed.volume
                            }
        res.append(quote)
    data = json_normalize(res)
    data=data.set_index('Date')
    #data.to_csv('test.csv')
    return data
    

def get_realtime_hist(symbol, interval, maxdatapoints,datadirection=0,requestid='',datapointspersend='',intervaltype=''):
    #get_bitstampfeed()
    global feed
    global ohlc
    
    symbol=symbol.upper()
    instrument_list=Instrument.search().filter('match_phrase',sym=symbol).execute()
    if instrument_list and len(instrument_list) > 0:
        instrument=instrument_list[0]
    else:
        instrument=Instrument()
        instrument.sym=symbol
        instrument.save()
    
    bg_get_hist(instrument, symbol, interval, maxdatapoints,datadirection,requestid,datapointspersend,intervaltype)
    
    
    from pandas.io.json import json_normalize
    
    feed_list=Feed.search().filter('term',frequency=interval).filter('term',instrument_id=instrument.id).sort('-date')
    feed_list=feed_list[:int(maxdatapoints)]
    res=[]
    for feed in feed_list:
        quote={ 'Date':feed.date,
                               'Open':feed.open,
                                'High':feed.high,
                                'Low':feed.low,
                                'Close':feed.close,
                                'Volume':feed.volume
                            }
        res.append(quote)
    data = json_normalize(res)
    data=data.set_index('Date')
    #data.to_csv('test.csv')
    return data

def bg_get_hist(instrument, symbol, interval, maxdatapoints,datadirection=0,requestid='',datapointspersend='',intervaltype=''):
    try:
        # The IP address or hostname of your reader
        READER_HOSTNAME = 'localhost'
        # The TCP port specified in Speedway Connect
        READER_PORT = 9100
        # Define the size of the buffer that is used to receive data.
        BUFFER_SIZE = 1024
         
        # Open a socket connection to the reader
        s = socket.create_connection((READER_HOSTNAME, READER_PORT))
             
        # Set the socket to non-blocking
        #s.setblocking(0)
         
        # Make a file pointer from the socket, so we can read lines
        fs=s.makefile()
        # Receive data in an infinite loop
        cmd="HIX,%s,%s,%s,%s,%s,%s,%s\r\n" % (symbol, interval, maxdatapoints,datadirection,requestid,datapointspersend,intervaltype)
        s.sendall(cmd);
        
        data = pd.DataFrame({}, columns=['Date','Open','High','Low','Close','Volume','TotalVolume']).set_index('Date')
        i=0
        while 1:
            try:
                line = fs.readline()
                # If data was received, print it
                if (len(line)):
                    #print line
                    fields=line.strip().split(',')
                    '''
                        Format    Notes
                            Request ID    Text    This field will only exist if the request specified a RequestID. If not specified in the request, the first field in each message will be the Timestamp.
                            Time Stamp    CCYY-MM-DD HH:MM:SS    Example: 2008-09-01 16:00:01
                            High    Decimal    Example: 146.2587
                            Low    Decimal    Example: 145.2587
                            Open    Decimal    Example: 146.2587
                            Close    Decimal    Example: 145.2587
                            Total Volume    Integer    Example: 1285001
                            Period Volume    Integer    Example: 1285
                            Number of Trades    Integer    Example: 10000 - Will be zero for all requests other than tick interval requests
                            Example data:    Request: HIX,GOOG,60,10<CR><LF>
                            2013-08-12 13:44:00,886.0680,886.0680,886.0680,886.0680,1010550,200,0,<CR><LF>
                    '''
                    if fields[0] == '!ENDMSG!':
                        s.close()
                        
                        return data
                    else:
                        #print line
                        date=fields[0]
                        high=float(fields[1])
                        low=float(fields[2])
                        open=float(fields[3])
                        close=float(fields[4])
                        total_volume=float(fields[5])
                        volume=float(fields[6])
                        trades=fields[7]
                        
                        
                       
                        if date:
                            
                            date=dateutil.parser.parse(date)
                            date=eastern.localize(date,is_dst=True)
                            #print date
                            quote={ 'Date':date,
                                'Open':open,
                                'High':high,
                                'Low':low,
                                'Close':close,
                                'Volume':volume,
                                'TotalVolume':total_volume,
                               #'wap':WAP,
                            }
                            #print quote
                            saveQuote(symbol, instrument, interval, quote)
                            #self.saveQuote(dbcontract, quote)
                            
                            data.loc[date] = [open,high,low,close,volume,total_volume]
                            i+=1
                            #print date,high,low,open,close,volume,total_volume,trades
            except Exception as e:
                logging.error("get_btcfeed", exc_info=True)
                    
        return data
    except Exception as e:
        print e

def get_mult_hist(symbols, interval, maxdatapoints,datadirection=0,requestid='',datapointspersend='',intervaltype='', loop=True):
    #get_bitstampfeed()
    global feed
    global ohlc
    
    
    
    bg_get_hist_mult(symbols, interval, maxdatapoints,datadirection,requestid,datapointspersend,intervaltype, loop=True)
    



def bg_get_hist_mult(symbols, interval, maxdatapoints,datadirection=0,requestid='',datapointspersend='',intervaltype='', loop=True):
    try:
        # The IP address or hostname of your reader
        READER_HOSTNAME = 'localhost'
        # The TCP port specified in Speedway Connect
        READER_PORT = 9100
        # Define the size of the buffer that is used to receive data.
        BUFFER_SIZE = 1024
         
        # Open a socket connection to the reader
        s = socket.create_connection((READER_HOSTNAME, READER_PORT))
             
        # Set the socket to non-blocking
        #s.setblocking(0)
         
        # Make a file pointer from the socket, so we can read lines
        fs=s.makefile()
        while 1:
            for symbol in symbols:
                symbol=symbol.upper()
                print 'Getting ', symbol
                instrument_list=Instrument.search().filter('match_phrase',sym=symbol).execute()
                if instrument_list and len(instrument_list) > 0:
                    instrument=instrument_list[0]
                else:
                    instrument=Instrument()
                    instrument.sym=symbol
                    instrument.save()                # Receive data in an infinite loop
                cmd="HIX,%s,%s,%s,%s,%s,%s,%s\r\n" % (symbol, interval, maxdatapoints,datadirection,requestid,datapointspersend,intervaltype)
                s.sendall(cmd);
                
                data = pd.DataFrame({}, columns=['Date','Open','High','Low','Close','Volume','TotalVolume']).set_index('Date')
                i=0
                while 1:
                    try:
                        line = fs.readline()
                        # If data was received, print it
                        if (len(line)):
                            #print line
                            fields=line.strip().split(',')
                            '''
                                Format    Notes
                                    Request ID    Text    This field will only exist if the request specified a RequestID. If not specified in the request, the first field in each message will be the Timestamp.
                                    Time Stamp    CCYY-MM-DD HH:MM:SS    Example: 2008-09-01 16:00:01
                                    High    Decimal    Example: 146.2587
                                    Low    Decimal    Example: 145.2587
                                    Open    Decimal    Example: 146.2587
                                    Close    Decimal    Example: 145.2587
                                    Total Volume    Integer    Example: 1285001
                                    Period Volume    Integer    Example: 1285
                                    Number of Trades    Integer    Example: 10000 - Will be zero for all requests other than tick interval requests
                                    Example data:    Request: HIX,GOOG,60,10<CR><LF>
                                    2013-08-12 13:44:00,886.0680,886.0680,886.0680,886.0680,1010550,200,0,<CR><LF>
                            '''
                            if fields[0] == '!ENDMSG!':
                                #s.close()
                                time.sleep(1)
                                print 'Done',symbol
                                break;
                                #return data
                            else:
                                #print line
                                date=fields[0]
                                high=float(fields[1])
                                low=float(fields[2])
                                open=float(fields[3])
                                close=float(fields[4])
                                total_volume=float(fields[5])
                                volume=float(fields[6])
                                trades=fields[7]
                                
                                
                               
                                if date:
                                    
                                    date=dateutil.parser.parse(date)
                                    date=eastern.localize(date,is_dst=True)
                                    #print date
                                    quote={ 'Date':date,
                                        'Open':open,
                                        'High':high,
                                        'Low':low,
                                        'Close':close,
                                        'Volume':volume,
                                        'TotalVolume':total_volume,
                                       #'wap':WAP,
                                    }
                                    if i > 0:
                                        saveQuote(symbol, instrument, interval, quote)
                                    #self.saveQuote(dbcontract, quote)
                                    
                                    data.loc[date] = [open,high,low,close,volume,total_volume]
                                    i+=1
                                #print date,high,low,open,close,volume,total_volume,trades
                    except Exception as e:
                        logging.error("get_btcfeed", exc_info=True)
            if not loop:
                break;            
        return data
    except Exception as e:
        print e
def saveQuote(symbol, instrument, interval, quote):
        #if quote.has_key('wap'):
        #    print ' wap:' + str(quote['wap']) 
        frequency=interval
        
        
        date=quote['Date'] # .replace(tzinfo=eastern) - relativedelta(minutes=1) 
        
        bar_list=Feed.search().filter('term',date=date).filter('term',instrument_id=instrument.id).filter('term',frequency=frequency)
        #print "close Bar: " + str(dbcontract.id) + " freq ",dbcontract.frequency, " date:" + str(quote['date']) + "date ",date, " open: " + str(quote['open']) + " high:"  + str(quote['high']) + ' low:' + str(quote['low']) + ' close: ' + str(quote['close']) + ' volume:' + str(quote['volume']) 
        if bar_list and bar_list.count() > 0:
            print symbol
            bar=bar_list.execute()[0]
            #print "found bar id",bar.id
        else:
            print symbol
        
            #print 'New Bar: ', quote
            bar=Feed()
            bar.instrument_id=instrument.id
            bar.frequency=frequency
            bar.date=date
        bar.open= quote['Open']
        bar.high= quote['High']
        bar.low= quote['Low']
        bar.close= quote['Close']
        bar.volume= quote['Volume']
        if quote.has_key('VWAP'):
            bar.wap=quote['VWAP']
        bar.save()
        
def    main():
    if len(sys.argv) > 3:
        symbol=sys.argv[1]
        interval=sys.argv[2]
        maxdatapoints=sys.argv[3]
        data=get_hist(symbol, interval, maxdatapoints) #,datadirection=0,requestid='',datapointspersend='',intervaltype=''):
    else:
        print "Usage: dbhist.py AAPL 60 100"
        
if    __name__    ==    "__main__":
    try:
        main()
    except    KeyboardInterrupt:
        pass

        
