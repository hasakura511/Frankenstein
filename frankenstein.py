import sys
import time
import requests
import math
import numpy as np
import pandas as pd
import sqlite3
import talib as ta
import os
import json
from os import listdir
from os.path import isfile, join
import datetime
from datetime import datetime as dt
import scripts.iqfeed.dbhist as dbhist

# API
# SYM = FrankiesSystem(symbol, get_hist_func)
# SYM.run() - saves signal transmits to broker
c2id = "110064634"
c2key = "aQWcUGsCEMPTUjuogyk8G5qb3pk4XM6IG5iRdgCnKdWLxFVjeF"
typeofsymbol = "stock"
duration = "DAY"
dataPath = './data/'
portfolioPath=dataPath+c2id+'/'
lastDate = datetime.datetime(1000, 1, 1)


def getBackendDB():
    dbPath = 'stocks.sqlite3'
    readConn = sqlite3.connect(dbPath)
    return readConn

def getTables(dbcon):
    cursor = dbcon.cursor()
    cursor.execute("SELECT name FROM sqlite_master WHERE type='table';")
    return [x[0] for x in cursor.fetchall()]

def checkTableExists(dbcon, tablename):
    dbcur = dbcon.cursor()
    dbcur.execute("""
        SELECT COUNT(*)
        FROM sqlite_master
        WHERE type= 'table' AND name = '{0}'
        """.format(tablename.replace('\'', '\'\'')))
    if dbcur.fetchone()[0] == 1:
        dbcur.close()
        return True

    dbcur.close()
    return False

def getFeed(symbol, lookback, interval):
    global lastDate

    data = dbhist.get_hist(symbol, interval, lookback).sort_index(ascending=True)
    print 'last bar', data.index[-1], 'last processed bar', lastDate
    if data.index[-1] > lastDate:
        lastDate = data.index[-1]
        return data
    else:
        return None


def getFeedHistory(symbol, maxlookback, interval):
    # global lastDate
    historylength = maxlookback * 2

    data = dbhist.get_hist(symbol, interval, historylength).sort_index(ascending=True)
    print data

    filename = dataPath + symbol + '_signals.csv'
    if isfile(filename):
        os.remove(filename)
        print(filename + " Removed!")
    for i, j in enumerate(range(maxlookback, data.shape[0])):
        yield data.iloc[i:j]


def getHistory(symbol, maxlookback, interval):
    global dataPath
    # richie you do this
    filename = dataPath + symbol + '.csv'
    data = pd.read_csv(filename)
    data.Date = pd.to_datetime(data.Date)
    data = data.set_index('Date')
    # print data.columns
    data.columns = ['Open', 'High', 'Low', 'Close', 'Volume']
    # print data.columns
    for col in data.columns:
        data[col] = data[col].astype(float)
    filename = dataPath + symbol + '_signals.csv'
    if isfile(filename):
        os.remove(filename)
        print(filename + " Removed!")
    for i, j in enumerate(range(maxlookback, data.shape[0])):
        yield data.iloc[i:j]


def place_order(action, quant, sym, parentsig=None):
    global c2id
    global c2key
    global type
    url = 'https://api.collective2.com/world/apiv3/submitSignal'
    headers = {'content-type': 'application/json', 'Accept-Charset': 'UTF-8'}
    parentsig = "" if parentsig == None else parentsig
    data = {
        "apikey": c2key,  # "tXFaL4E6apdfmLtGasIovtGnUDXH_CQso7uBpOCUDYGVcm1w0w",
        "systemid": c2id,
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
    # logging.info(str(r.text))
    return r.json()['signalid']

def setDesiredPositions(orders):
    global c2id
    global c2key
    global type
    url = 'https://collective2.com/world/apiv3/setDesiredPositions'
    headers = {'content-type': 'application/json', 'Accept-Charset': 'UTF-8'}

    '''
    orders
    [{
        "symbol"		: "@ESM5",
        "typeofsymbol"	: "future",
        "quant"			: "-4"
    },
    {
        "symbol"		: "EURUSD",
        "typeofsymbol"	: "forex",
        "quant"			: "-3"
    },
    {
        "symbol"		: "AAPL",
        "typeofsymbol"	: "stock",
        "quant"			: "211"
    }]
    '''

    data = {
            "apikey":   c2key,
            "systemid": c2id,
            "positions": orders,
            }
    params = {}
    r = requests.post(url, params=params, json=data);
    # sleep(2)
    print r.text
    # logging.info(str(r.text))
    #return r.json()['signalid']




class Frankenstein():
    global dataPath
    global typeofsymbol
    global portfolioPath

    def __init__(self, symbol, mode, size, interval=300, broker=None):
        self.symbol = symbol
        self.size = size
        self.interval = interval
        self.broker = broker
        self.price_pctchg = 0.003
        self.ema_lookback = 9
        self.ema_lookback_pctchg = 0.001
        self.ema_lookback2 = 20
        self.max_emalookback = max(self.ema_lookback, self.ema_lookback2)
        self.vwap_lookback = self.max_emalookback + 24 * 60 / 5
        self.maxlookback = max(self.max_emalookback, self.vwap_lookback)
        self.mode = mode
        if mode == 'live':
            # self.feed = getFeed(self.symbol, self.maxlookback)
            self.signal_filename = dataPath + self.symbol + '_livesignals_' \
                                   + dt.now().strftime('%Y%m%d_%H_%M_%S') + '.csv'
            #print 'Writing to', self.signal_filename
            # if isfile(self.filename):
            #    os.remove(self.filename)
            #    print(self.filename+" Removed!")
        else:
            self.feed = getHistory(self.symbol, self.maxlookback, self.interval)
            # self.feed = getFeedHistory(self.symbol, self.maxlookback, self.interval)
            self.signal_filename = dataPath + self.symbol + '_signals.csv'
        self.dbConn = getBackendDB()
        self.portfolio_filename = portfolioPath + self.symbol + '.json'

    def check(self):
        # print 'lookback', self.maxlookback
        check_time = time.time()
        if self.mode == 'live':
            data = getFeed(self.symbol, self.maxlookback, self.interval)
            if data is None:
                print 'new bar not ready'
                return
        else:
            data = self.feed.next().copy()

        start_idx = [(i, date) for i, date in enumerate(data.index) \
                     if date.minute == 35 and date.hour == 9]
        # print start_idx
        if len(start_idx) == 0:
            print '935 bar not found'
        else:
            start_ema = start_idx[-1][0] - self.max_emalookback

            data = data.iloc[start_ema + 1:]
            print 'start_ema', data.iloc[0].name,
            EMA1 = 'EMA' + str(self.ema_lookback)
            EMA2 = 'EMA' + str(self.ema_lookback2)

            #nan creating indicators
            data['ClosePC'] = data.Close.pct_change()
            data[EMA1] = ta.EMA(data.Close.values, timeperiod=self.ema_lookback)
            data[EMA1 + 'PC'] = data[EMA1].pct_change()
            data[EMA2] = ta.EMA(data.Close.values, timeperiod=self.ema_lookback2)

            data = data.dropna()
            data['ClosePC>' + str(self.price_pctchg)] = \
                np.where(data['ClosePC'].values > self.price_pctchg, 1, 0)
            data[EMA1 + 'PC>' + str(self.ema_lookback_pctchg)] = \
                np.where(data[EMA1 + 'PC'].values > \
                         self.ema_lookback_pctchg, 1, 0)
            data[EMA1 + '>' + EMA2] = np.where(data[EMA1] > data[EMA2], 1, 0)

            print 'start_vwap', data.iloc[0].name,
            print 'last_bar', data.iloc[-1].name,
            data['VP'] = (data.High + data.Low + data.Close) / 3 * data.Volume
            data['TotalVP'] = data.VP.cumsum()
            data['TotalVolume'] = data.Volume.cumsum()
            data['VWAP'] = data.TotalVP / data.TotalVolume
            data[EMA1 + '>VWAP'] = np.where(data[EMA1] > data.VWAP, 1, -1)

            # signals and f
            c1 = data['ClosePC>' + str(self.price_pctchg)]
            c2 = data[EMA1 + 'PC>' + str(self.ema_lookback_pctchg)]
            c3 = data[EMA1 + '>' + EMA2]
            data['impulse'] = np.where(c1 + c2 + c3 >= 3, 1, 0)
            state = []
            for i, x in enumerate(data.impulse):
                if i == 0:
                    # print 0
                    state.append(0)
                else:
                    if x == 0:
                        state.append(state[i - 1])
                    else:
                        state.append(x)
            data['state'] = state
            data['F']=1
            data['QTY']=[int(x) if x==0 else int(self.size/x) for x in (data.state*data.F*data.Close)]

            self.lastdata = data
            self.lastbar = data.iloc[-1]

            if 'signals' in dir(self):
                self.signals = self.signals.append(self.lastbar)
                self.previousqty = int(self.lastqty)
                self.lastqty = int(self.lastbar.QTY)
                #transmit after first bar of the day.
                if self.broker is not None and self.previousqty != self.lastqty:
                    self.transmit()
            else:
                self.signals = data.copy()
                self.previousqty = 0
                self.lastqty = int(self.lastbar.QTY)

        print 'ET: ', round(((time.time() - start_time) / 60), 2), ' minutes'

    def transmit(self):
        order = {
            "symbol"	: self.symbol,
            "typeofsymbol"	: typeofsymbol,
            "quant"			: self.lastqty
            #"quant"		: "-100"
        }
        print 'Transmitting', order

        with open(self.portfolio_filename, 'w') as f:
            json.dump(order, f)
            print 'Saved', self.portfolio_filename
        orders=[]
        positions = listdir(portfolioPath)
        for position in positions:
            filename = portfolioPath+position
            with open(filename, 'r') as f:
                order = json.load(f)
            orders.append(order)
        setDesiredPositions(orders)
        print 'sent signal to broker'

    def close_position(self):
        print 'Closing', self.symbol, self.lastqty
        self.lastqty=0
        self.transmit()

    def marketopen(self):
        today=dt.now()
        if today.weekday()<5 and (today.time()>=datetime.time(9,30))\
            and (today.time()<datetime.time(16,0)):
            return True
        else:
            return False

    def run(self):
        while True:
            try:
                self.check()
            except StopIteration:
                print 'EOF'
                break
        self.signals.to_csv(self.signal_filename, index=True)
        self.lastdata.to_csv(dataPath + self.symbol + '_last.csv')
        print 'Wrote to', self.signal_filename, dataPath + self.symbol + '_last.csv'

    def runlive(self):
        self.check()
        self.signals.to_csv(self.signal_filename, index=True)
        self.lastdata.to_csv(dataPath + self.symbol + '_last.csv')
        print 'Writing to', self.signal_filename, dataPath + self.symbol + '_last.csv'
        while True and self.broker is not None:
            #try:
                print 'now', dt.now(),
                if self.marketopen():
                    self.check()
                    self.signals.to_csv(self.signal_filename, index=True)
                    self.lastdata.to_csv(dataPath + self.symbol + '_last.csv')
                else:
                    print 'Market Closed. Exiting.'
                    sys.exit('market closed')


                timenow = time.localtime(time.time())
                # print timenow,
                timeleft = (self.interval - timenow[4] * 60 - timenow[5]) % self.interval
                # print timeleft
                if timeleft == 0:
                    time.sleep(2)
                    timeleft = (self.interval - timenow[4] * 60 - timenow[5]) % self.interval

                time.sleep(timeleft)
            #except Exception as e:
            #    print e


if __name__ == "__main__":
    start_time = time.time()
    if len(sys.argv) == 1:
        # filename = '5m_#TeslaMotor.csv'
        symbol = 'TSLA'
        mode = 'test'
        size = 5000
        frank = Frankenstein(symbol, mode, size)
    else:
        mode = 'live'
        symbol = sys.argv[1]
        size = int(sys.argv[2])
        if len(sys.argv) > 3:
            broker = sys.argv[3]
            frank = Frankenstein(symbol, mode, size, broker=broker)
        else:
            frank = Frankenstein(symbol, mode, size)

        frank.runlive()

    # frank.run()
    print 'Elapsed time: ', round(((time.time() - start_time) / 60), 2), ' minutes ', dt.now()
