import sys
import iqfeed.dbhist as dbhist
import time
import os
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "beCOMPANY.settings")
import beCOMPANY
import beCOMPANY.settings as settings
from main.models import *
import datetime
import psycopg2
import csv

"""
Created on Tue Mar 08 20:10:29 2016
3 mins - 2150 dp per request
10 mins - 630 datapoints per request
30 mins - 1025 datapoints per request
1 hour - 500 datapoint per request
@author: Hidemi
"""


def    main():
    if len(sys.argv) > 2:
        symbols=[]
        with open("../stocks.txt", 'rb') as f:
            reader = csv.reader(f)
            rownum=0
            for row in reader:
                rownum+=1
                if rownum > 1:
                    (symbol,qty,exch)=row
                    symbols.append(symbol)
        interval=sys.argv[1]
        maxdatapoints=sys.argv[2]
        #while 1:
        data=dbhist.get_mult_hist(symbols, interval, maxdatapoints) #,datadirection=0,requestid='',datapointspersend='',intervaltype=''):
        #time.sleep(5)
    else:
        print "Usage: get_iqhist.py 300 100"
        
if    __name__    ==    "__main__":
    try:
        main()
    except    KeyboardInterrupt:
        pass
