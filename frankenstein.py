import sys
import time
import math
import numpy as np
import pandas as pd
import sqlite3
import talib as ta
from os import listdir
from os.path import isfile, join

#API
#SYM = FrankiesSystem(symbol, get_hist_func)
#SYM.check() - saves signal transmits to broker

dataPath='./data/'
def getBackendDB():
    dbPath = 'stocks.sqlite3'
    readConn = sqlite3.connect(dbPath)
    return readConn

def getFeed(symbol, maxlookback):
    #richie you do this
    #return history
    #if there is no new feed then return None
    return pd.read_csv('./data/5m_#TeslaMotor.csv')

def getHistory(symbol, maxlookback):
    global dataPath
    #richie you do this
    data = pd.read_csv(dataPath+symbol)
    for i,j in enumerate(range(maxlookback,data.shape[0])):
        yield data.iloc[i:j]


class Frankenstein():
    #i'll do this
    global dataPath
    def __init__(self, symbol, feed, ema_lookback=9, vwap_lookback=78):
        self.symbol = symbol
        self.ema_lookback=ema_lookback
        self.vwap_lookback = ema_lookback
        self.maxlookback = max(ema_lookback, vwap_lookback)
        self.feed = feed(symbol, self.maxlookback)
        self.dbConn=getBackendDB()

    def check(self):
        #print 'lookback', self.maxlookback
        data=self.feed.next().copy()
        data['VP']=(data.High+data.Low+data.Close)/3*data.Volume
        data['TotalVP'] = data.VP.cumsum()
        data['TotalVolume'] = data.Volume.cumsum()
        data['VWAP'] = data.TotalVP/data.TotalVolume
        data['EMA']=ta.EMA(data.Close.values, timeperiod=self.ema_lookback)
        data['EMA>VWAP']=np.where(data.EMA>data.VWAP,1,-1)
        self.lastdata=data

        #savedata
        data.to_csv(dataPath+self.symbol+'_last.csv')
        #print data.iloc[-1]
        print data.iloc[-1].Date,
        filename = dataPath+self.symbol+'.csv'
        if isfile(filename):
            signalfile=pd.read_csv(filename).append(data.iloc[-1])
            signalfile.to_csv(filename, index=False)
        else:
            signalfile=data.iloc[-2:]
            signalfile.to_csv(filename, index=False)
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
        filename = '5m_#TeslaMotor.csv'
    else:
        filename = sys.argv[1]

    frank = Frankenstein(filename, getHistory)
    # frank = Frankenstein('TSLA', getFeed)
    frank.run()

