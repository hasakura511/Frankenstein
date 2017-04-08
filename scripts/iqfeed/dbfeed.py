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
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "beCOMPANY.settings")
import beCOMPANY
import beCOMPANY.settings as settings
from main.models import *
from dateutil.parser import parse
import psycopg2
import threading
from dateutil.relativedelta import relativedelta
import time
eastern=timezone('US/Eastern')

try:
    dbstr="dbname=" + settings.DATABASES['default']['NAME'] + \
          " user=" + settings.DATABASES['default']['USER'] + \
          " password=" + settings.DATABASES['default']['PASSWORD'] + \
          " host=" + settings.DATABASES['default']['HOST'] + \
          " port=" + settings.DATABASES['default']['PORT']
          
    c=psycopg2.connect(dbstr)
except:
    print "I am unable to connect to the database."
    
    
logging.basicConfig(stream=sys.stdout,  level=logging.DEBUG)
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
    instrument_list=Instrument.objects.filter(sym=symbol)
    if instrument_list and len(instrument_list) > 0:
        instrument=instrument_list[0]
    else:
        instrument=Instrument()
        instrument.sym=symbol
        instrument.save()
    
    sql = ' SELECT date as "Date", open as "Open", high as "High", low as "Low", close as "Close", volume as "Volume" '
    sql +=' FROM main_feed2 '
    sql +=' WHERE frequency=%s AND instrument_id=%s ' % (interval, instrument.id)
    sql +=' ORDER by date DESC LIMIT %s ' % (maxdatapoints)
    data = pd.read_sql(sql, c, index_col='Date')
    data.index=data.index.tz_convert(eastern)
    #print data.index[-1]
    return data



def bg_get_feed(instrument, symbol, interval, maxdatapoints,datadirection=0,requestid='',datapointspersend='',intervaltype=''):
    try:
        # The IP address or hostname of your reader
        READER_HOSTNAME = 'localhost'
        # The TCP port specified in Speedway Connect
        READER_PORT = 5009
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
        
        #data = pd.DataFrame({}, columns=['Date','Open','High','Low','Close','Volume','TotalVolume']).set_index('Date')
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

def get_mult_hist(symbols, interval, maxdatapoints,datadirection=0,requestid='',datapointspersend='',intervaltype=''):
    #get_bitstampfeed()
    global feed
    global ohlc
    
    
    
    bg_get_hist_mult(symbols, interval, maxdatapoints,datadirection,requestid,datapointspersend,intervaltype)
    



def bg_get_hist_mult(symbols, interval, maxdatapoints,datadirection=0,requestid='',datapointspersend='',intervaltype=''):
    #try:
        interval=int(interval)
        
        symstate=dict()
        # The IP address or hostname of your reader
        READER_HOSTNAME = 'localhost'
        # The TCP port specified in Speedway Connect
        READER_PORT = 5009
        # Define the size of the buffer that is used to receive data.
        BUFFER_SIZE = 1024
         
        # Open a socket connection to the reader
        s = socket.create_connection((READER_HOSTNAME, READER_PORT))
             
        cmd = "S,REQUEST ALL UPDATE FIELDNAMES\r\n";
        s.sendall(cmd);

        cmd = "S,SELECT UPDATE FIELDS,Symbol,Ask,Ask Size,Bid,Bid Size,Total Volume,VWAP,Open,High,Low,Close\r\n";
        s.sendall(cmd)
        
        # Make a file pointer from the socket, so we can read lines
        fs=s.makefile()
        while 1:
            for symbol in symbols:
                symbol=symbol.upper()
                print 'Getting ', symbol
                instrument_list=Instrument.objects.filter(sym=symbol)
                if instrument_list and len(instrument_list) > 0:
                    instrument=instrument_list[0]
                else:
                    instrument=Instrument()
                    instrument.sym=symbol
                    instrument.save()
                # Receive data in an infinite loop
                cmd="w%s\r\n" % (symbol)
                s.sendall(cmd);
                
                #data = pd.DataFrame({}, columns=['Date','Open','High','Low','Close','Volume','TotalVolume']).set_index('Date')
                i=0

            datenow=datetime.now()
            min_interval=datenow.minute
            diff=(min_interval * 60) % interval

            while 1:
                #try:
                    line = fs.readline()
                    print line
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
                        ''
                        if fields[0] == '!ENDMSG!':
                            #s.close()
                            #time.sleep(1)
                            print 'Done',symbol
                            #return data
                        else:
                            print line
                            '''
                            Symbol,Ask,Ask Size,Bid,Bid Size,Total Volume,VWAP,
                            Open,High,Low,Close,Most Recent Trade,Most Recent Trade Size,Most Recent Trade Time,Most Recent Trade Market Center,Message Contents,Most Recent Trade Conditions
                            '''
                            

                            if fields[0] == 'T':
                                print 'Timestamp: ', line
                                datenow=parse(fields[1])
                                min_interval=datenow.minute
                                diff=(min_interval * 60) % interval

                                for sym in symstate.keys():
                                    if diff == 0:
                                        date=datetime(datenow.year, datenow.month, datenow.day, datenow.hour, datenow.minute)
                                        if symstate.has_key(sym) and symstate[sym].has_key('ask'):
                                            ask=symstate[sym]['ask']
                                            bid=symstate[sym]['bid']
                                            mid=(ask+bid)/2
                                            total_volume=symstate[sym]['total_volume']
                                            vwap=symstate[sym]['vwap']
                                                
                                            if not symstate[sym].has_key('open'):
                                                
                                                symstate[sym]['enddate']=date
                                                symstate[sym]['startdate']=date
                                                symstate[sym]['last_total_volume']=total_volume
                                                symstate[sym]['open']=mid
                                                symstate[sym]['close']=mid
                                        
                                            if date > symstate[sym]['enddate']:
                                                diff_sec=symstate[sym]['enddate'] - symstate[sym]['enddate'].minute
                                                diff_sec=diff_sec.total_seconds()
                                                if diff_sec >= interval:
                                                    symstate[sym]['date']=date
                                                    symstate[sym]['close']=mid
                                                    date=eastern.localize(date,is_dst=True)
                                                    #print date
                                                    symstate[sym]['volume']=total_volume - symstate[sym]['last_total_volume']
                                                    quote={ 'Date':date,
                                                        'Open':symstate[sym]['open'],
                                                        'High':symstate[sym]['high'],
                                                        'Low':symstate[sym]['low'],
                                                        'Close':symstate[sym]['close'],
                                                        'Volume':symstate[sym]['volume'],
                                                        'TotalVolume':symstate[sym]['total_volume'],
                                                       #'wap':WAP,
                                                    }
                                                    self.saveQuote(dbcontract, quote)
                                            
                                                    symstate[sym]['startdate']=symstate[sym]['enddate']
                                                    symstate[sym]['enddate']=date
                                                    saveQuote(symbol, instrument, interval, quote)
                                                    symstate[sym]['last_total_volume']=total_volume
                                                    symstate[sym]['asksize']=0
                                                    symstate[sym]['bidsize']=0
                                                    symstate[sym]['open']=symstate[sym]['close']
                                    
                            if fields[0] == 'Q':
                                sym=fields[1]
                                ask=float(fields[2])
                                asksize=float(fields[3])
                                bid=float(fields[4])
                                bidsize=float(fields[5])
                                total_volume=float(fields[6])
                                vwap=float(fields[7])
                                open=float(fields[8])
                                high=float(fields[9])
                                low=float(fields[10])
                                close=float(fields[11])

                                
                                if not symstate.has_key(sym):
                                    mid=(ask+bid)/2
                                    symstate[sym]=dict()
                                    symstate[sym]['ask']=ask
                                    symstate[sym]['asksize']=0
                                    symstate[sym]['bid']=bid
                                    symstate[sym]['bidsize']=0
                                    symstate[sym]['vwap']=vwap
                                    symstate[sym]['total_volume']=total_volume
                                    symstate[sym]['last_total_volume']=total_volume
                                    
                                if symstate.has_key(sym):
                                    symstate[sym]=dict()
                                    mid=(ask+bid)/2
                                    if mid > symstate[sym]['high']:
                                        symstate[sym]['high']=mid
                                    symstate[sym]['ask']=ask
                                    
                                    symstate[sym]['asksize']+=asksize
                                    if mid < symstate[sym]['low']:
                                        symstate[sym]['low']=mid
                                    symstate[sym]['bidsize']+=bidsize
                                    symstate[sym]['vwap']=vwap
                                    symstate[sym]['total_volume']=total_volume
                                    
                                    
                #except Exception as e:
                #        logging.error("get_btcfeed", exc_info=True)
                        
        
    #except Exception as e:
    #    print e
def saveQuote(symbol, instrument, interval, quote):
        #if quote.has_key('wap'):
        #    print ' wap:' + str(quote['wap']) 
        
        frequency=interval
        
        
        date=quote['Date'] # .replace(tzinfo=eastern) - relativedelta(minutes=1) 
        
        bar_list=Feed2.objects.filter(date=date).filter(instrument_id=instrument.id).filter(frequency=frequency)
        #print "close Bar: " + str(dbcontract.id) + " freq ",dbcontract.frequency, " date:" + str(quote['date']) + "date ",date, " open: " + str(quote['open']) + " high:"  + str(quote['high']) + ' low:' + str(quote['low']) + ' close: ' + str(quote['close']) + ' volume:' + str(quote['volume']) 
        if bar_list and len(bar_list) > 0:
            bar=bar_list[0]
            #print "found bar id",bar.id
        else:
            print 'New Bar: ', quote
            bar=Feed2()
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

        
