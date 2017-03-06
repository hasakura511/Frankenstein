import sys
import time
import math
import numpy as np
import pandas as pd
import sqlite3
import talib as ta
import os
from os import listdir
from os.path import isfile, join

#API
#SYM = FrankiesSystem(symbol, get_hist_func)
#SYM.run() - saves signal transmits to broker

dataPath='./data/'
def getBackendDB():
    dbPath = 'stocks.sqlite3'
    readConn = sqlite3.connect(dbPath)
    return readConn

def getFeed(symbol, maxlookback, barsize='5min'):
    #richie you do this
    #return history
    #if there is no new feed then return None
    return

def getHistory(symbol, maxlookback):
    global dataPath
    #richie you do this
    filename=dataPath+symbol+'.csv'
    data = pd.read_csv(filename)
    data.Date=pd.to_datetime(data.Date)
    data=data.set_index('Date')
    #print data.columns
    data.columns=['Open','High','Low','Close','Volume']
    #print data.columns
    filename = dataPath + symbol + '_signals.csv'
    if isfile(filename):
        os.remove(filename)
        print(filename+" Removed!")
    for i,j in enumerate(range(maxlookback,data.shape[0])):
        yield data.iloc[i:j]


def place_order(action, quant, sym, type, systemid, apikey, parentsig=None):
    url = 'https://collective2.com/world/apiv2/submitSignal'
    headers = {'content-type': 'application/json', 'Accept-Charset': 'UTF-8'}
    parentsig = "" if parentsig == None else parentsig
    data = {
        "apikey": apikey,  # "tXFaL4E6apdfmLtGasIovtGnUDXH_CQso7uBpOCUDYGVcm1w0w",
        "systemid": systemid,
        "signal": {
            "action": action,
            "quant": quant,
            "symbol": sym,
            "typeofsymbol": type,
            "market": 1,  # "limit": 31.05,
            "duration": "DAY",
            "signalid": "",
            "conditionalupon": parentsig
        }
    }
    params = {}
    r = requests.post(url, params=params, json=data);
    # sleep(2)
    print r.text
    #logging.info(str(r.text))
    return r.json()['signalid']

class Frankenstein():
    #i'll do this
    global dataPath
    def __init__(self, symbol, feed, ema_lookback=9, vwap_lookback=102):
        self.symbol = symbol
        self.ema_lookback=ema_lookback
        self.vwap_lookback = ema_lookback
        self.maxlookback = max(ema_lookback, vwap_lookback)
        self.feed = feed(symbol, self.maxlookback)
        self.dbConn=getBackendDB()

    def check(self):
        #print 'lookback', self.maxlookback
        data=self.feed.next().copy()
        start_idx=[(i,date) for i,date in enumerate(data.index)\
                   if date.minute == 35 and date.hour ==9]
        if len(start_idx)==0:
            print data.to_csv(dataPath+'startidx0.csv')
        else:
            start_ema = start_idx[-1][0] - self.ema_lookback
            print start_idx[-1], start_ema,

            data=data.iloc[start_ema+1:]
            data['EMA']=ta.EMA(data.Close.values, timeperiod=self.ema_lookback)

            #start_vwap=start_idx[-1][1]
            #data=data.ix[start_vwap:]
            #print data
            data=data.dropna()
            data['VP']=(data.High+data.Low+data.Close)/3*data.Volume
            data['TotalVP'] = data.VP.cumsum()
            data['TotalVolume'] = data.Volume.cumsum()
            data['VWAP'] = data.TotalVP/data.TotalVolume
            data['EMA>VWAP']=np.where(data.EMA>data.VWAP,1,-1)
            self.lastdata=data

            #savedata
            data.to_csv(dataPath+self.symbol+'_last.csv')
            #print data.iloc[-1]
            print data.iloc[-1].name
            filename = dataPath+self.symbol+'_signals.csv'
            if isfile(filename):
                signalfile=pd.read_csv(filename, index_col='Date').append(data.iloc[-1])
                signalfile.to_csv(filename, index=True)
            else:
                signalfile=data.iloc[-2:]
                signalfile.to_csv(filename, index=True)
            #data.iloc[-1].to_sql(name=self.symbol, con=self.dbConn,
            #                 index=False, if_exists='replace')

            signal_change = False
            if signal_change:
                self.transmit()

    def transmit(self):
        print 'transmitting signal to broker'

    def run(self):
        while True:
            try:
                self.check()
            except StopIteration:
                print 'EOF'
                break

if __name__ == "__main__":

    if len(sys.argv) == 1:
        #filename = '5m_#TeslaMotor.csv'
        symbol = 'TSLA'
    else:
        symbol = sys.argv[1]

    frank = Frankenstein(symbol, getHistory)
    # frank = Frankenstein('TSLA', getFeed)
    frank.run()

