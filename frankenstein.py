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
import datetime
from datetime import datetime as dt
import scripts.iqfeed.dbhist as dbhist

#API
#SYM = FrankiesSystem(symbol, get_hist_func)
#SYM.run() - saves signal transmits to broker
c2id="110064634"
c2key="aQWcUGsCEMPTUjuogyk8G5qb3pk4XM6IG5iRdgCnKdWLxFVjeF"
type="stock"
duration="DAY"

dataPath='./data/'
lastDate=datetime.datetime(1000,1,1)

def getBackendDB():
    dbPath = 'stocks.sqlite3'
    readConn = sqlite3.connect(dbPath)
    return readConn


def getFeed(symbol, lookback, interval):
    global lastDate

    data=dbhist.get_hist(symbol, interval, lookback).sort_index(ascending=True)
    print 'last bar', data.index[-1], 'last processed bar', lastDate
    if data.index[-1] > lastDate:
        lastDate=data.index[-1]
        return data
    else:
        return None



def getFeedHistory(symbol, maxlookback,interval):
    #global lastDate
    historylength=maxlookback*2

    data=dbhist.get_hist(symbol, interval, historylength).sort_index(ascending=True)
    print data

    filename = dataPath + symbol + '_signals.csv'
    if isfile(filename):
        os.remove(filename)
        print(filename+" Removed!")
    for i,j in enumerate(range(maxlookback,data.shape[0])):
        yield data.iloc[i:j]

def getHistory(symbol, maxlookback, interval):
    global dataPath
    #richie you do this
    filename=dataPath+symbol+'.csv'
    data = pd.read_csv(filename)
    data.Date=pd.to_datetime(data.Date)
    data=data.set_index('Date')
    #print data.columns
    data.columns=['Open','High','Low','Close','Volume']
    #print data.columns
    for col in data.columns:
        data[col]=data[col].astype(float)
    filename = dataPath + symbol + '_signals.csv'
    if isfile(filename):
        os.remove(filename)
        print(filename+" Removed!")
    for i,j in enumerate(range(maxlookback,data.shape[0])):
        yield data.iloc[i:j]

def place_order(action, quant, sym, type, systemid, apikey, parentsig=None):
    url = 'https://api.collective2.com/world/apiv3/submitSignal'
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
            "duration": duration,
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
    def __init__(self, symbol, mode, size, interval=300):
        self.symbol = symbol
        self.size = size
        self.interval= interval
        self.price_pctchg = 0.003
        self.ema_lookback = 9
        self.ema_lookback_pctchg = 0.001
        self.ema_lookback2 = 20
        self.max_emalookback = max(self.ema_lookback, self.ema_lookback2)
        self.vwap_lookback = self.max_emalookback+24*60/5
        self.maxlookback = max(self.max_emalookback, self.vwap_lookback)
        self.mode=mode
        if mode == 'live':
            #self.feed = getFeed(self.symbol, self.maxlookback)
            self.signal_filename = dataPath+self.symbol+'_livesignals_'\
                            +dt.now().strftime('%Y%m%d_%H_%M_%S')+'.csv'
            print 'Writing to', self.signal_filename
            #if isfile(self.filename):
            #    os.remove(self.filename)
            #    print(self.filename+" Removed!")
        else:
            #self.feed = getHistory(self.symbol, self.maxlookback, self.interval)
            self.feed = getFeedHistory(self.symbol, self.maxlookback, self.interval)
            self.signal_filename = dataPath+self.symbol+'_signals.csv'
        self.dbConn=getBackendDB()

    def check(self):
        #print 'lookback', self.maxlookback
        if self.mode =='live':
            data=getFeed(self.symbol, self.maxlookback, self.interval)
            if data is None:
                print 'new bar not ready'
                return
        else:
            data=self.feed.next().copy()
            
        start_idx=[(i,date) for i,date in enumerate(data.index)\
                   if date.minute == 35 and date.hour ==9]
        #print start_idx
        if len(start_idx)==0:
            print '935 bar not found'
        else:
            start_ema = start_idx[-1][0] - self.max_emalookback


            data=data.iloc[start_ema+1:]
            print 'start_ema', data.iloc[0].name,
            EMA1='EMA'+str(self.ema_lookback)
            EMA2='EMA'+str(self.ema_lookback2)
            data['ClosePC']=data.Close.pct_change()
            data['ClosePC>'+str(self.price_pctchg)]=\
                np.where(data['ClosePC'].values>self.price_pctchg,1,0)
            data[EMA1]=\
                ta.EMA(data.Close.values, timeperiod=self.ema_lookback)
            data[EMA1+'PC'] =\
                data[EMA1].pct_change()
            data[EMA1 + 'PC>'+str(self.ema_lookback_pctchg)]=\
                np.where(data[EMA1+'PC'].values>\
                         self.ema_lookback_pctchg,1,0)
            data[EMA2] =\
                ta.EMA(data.Close.values, timeperiod=self.ema_lookback2)
            data[EMA1+'>'+EMA2] = np.where(data[EMA1] > data[EMA2], 1, 0)


            data=data.dropna()
            print 'start_vwap', data.iloc[0].name,
            print 'last_bar',data.iloc[-1].name
            data['VP']=(data.High+data.Low+data.Close)/3*data.Volume
            data['TotalVP'] = data.VP.cumsum()
            data['TotalVolume'] = data.Volume.cumsum()
            data['VWAP'] = data.TotalVP/data.TotalVolume
            data[EMA1+'>VWAP']=np.where(data[EMA1]>data.VWAP,1,-1)

            #signals and f
            c1=data['ClosePC>'+str(self.price_pctchg)]
            c2=data[EMA1 + 'PC>'+str(self.ema_lookback_pctchg)]
            c3=data[EMA1+'>'+EMA2]
            data['impulse']=c1+c2+c3
            state = []
            for i, x in enumerate(data.impulse):
                if i == 0:
                    #print 0
                    state.append(0)
                else:
                    if x == 0:
                        state.append(state[i - 1])
                    else:
                        state.append(x)
            data['state']=state

            self.lastdata = data
            self.lastbar = data.iloc[-1]
            if 'signals' in dir(self):
                self.signals = self.signals.append(self.lastbar)
            else:
                self.signals = data.copy()

            if self.mode == 'live':
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
        self.signals.to_csv(self.signal_filename, index=True)
        self.lastdata.to_csv(dataPath + self.symbol + '_last.csv')

    def runlive(self):
        while True:
            try:
                print 'now', dt.now(),
                self.check()
                self.signals.to_csv(self.signal_filename, index=True)
                self.lastdata.to_csv(dataPath + self.symbol + '_last.csv')
                #print dt.now()
                timenow = time.localtime(time.time())
                #print timenow,
                timeleft = (self.interval - timenow[4] * 60 - timenow[5]) % self.interval
                #print timeleft
                if timeleft == 0:
                    time.sleep(1)
                    timeleft = (interval - timenow[4] * 60 - timenow[5]) % interval
                time.sleep(timeleft)
            except Exception as e:
                print e
                
                
if __name__ == "__main__":
    start_time = time.time()
    if len(sys.argv) == 1:
        #filename = '5m_#TeslaMotor.csv'
        symbol = 'TSLA'
        mode='test'
        size= 250
        frank = Frankenstein(symbol, mode, size)
    else:
        symbol = sys.argv[1]
        size = int(sys.argv[2])
        mode = 'live'
        frank = Frankenstein(symbol, mode)
        frank.runlive()
    

    

    
    
    #frank.run()
    print 'Elapsed time: ', round(((time.time() - start_time) / 60), 2), ' minutes ', dt.now()


