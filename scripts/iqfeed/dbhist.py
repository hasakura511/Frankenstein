import socket   
import select
import sys
import pytz
import datetime
from pytz import timezone
from datetime import datetime as dt
from tzlocal import get_localzone

import json
import time
from pandas.io.json import json_normalize
import pandas as pd
import threading
import sys
import logging
import time
#import websocket
import threading
import dateutil 
#lock = threading.Lock()

logging.basicConfig(stream=sys.stdout,  level=logging.DEBUG)
#logging.basicConfig(filename='/logs/get_hist.log',level=logging.DEBUG)

debug=False

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
                    print line
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
                        quote={ 'Date':date,
                            'Open':open,
                            'High':high,
                            'Low':low,
                            'Close':close,
                            'Volume':volume,
                            'TotalVolume':total_volume,
                           #'wap':WAP,
                        }
                        #self.saveQuote(dbcontract, quote)
                        
                        if i > 0:
                            data.loc[date] = [open,high,low,close,volume,total_volume]
                        i+=1
                        #print date,high,low,open,close,volume,total_volume,trades
        except Exception as e:
            logging.error("get_btcfeed", exc_info=True)
                
    return data


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

        
