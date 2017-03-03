import time
import math
import numpy as np
import pandas as pd
import sqlite3

#API
#SYM = FrankiesSystem(symbol, get_hist_func)
#SYM.save() - saves signal to csv
#SYM.transmit() - transmits signal to broker


def getHistory(symbol, maxlookback):
    #richie you do this
    return pd.read_csv('./data/5m_#TeslaMotor.csv')[-maxlookback:]


class Frankenstein():
    #i'll do this
    def __init__(self, symbol, feed, maxlookback=20):
        self.maxlookback = maxlookback
        self.symbol = symbol
        self.data = feed(symbol, maxlookback)

    def save(self):
        print 'lookback', len(self.data)
        print self.data.tail()
        signal_change = True
        if signal_change:
            self.transmit()

    def transmit(self):
        print 'transmitting to broker'

poochie = Frankenstein('F', getHistory)
poochie.save()
