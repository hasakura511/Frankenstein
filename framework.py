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
    return pd.read_csv('./data/5m_#TeslaMotor.csv')


class FrankiesSystem():
    #i'll do this
    def __init__(self, symbol, feed, maxlookback=20):
        self.maxlookback = maxlookback
        self.symbol = symbol
        self.data = feed(symbol, maxlookback)

    def save(self):
        print self.data.tail()

    def transmit(self):
        print 'transmitting to broker'

poochie = FrankiesSystem('F', getHistory)
poochie.save()
poochie.transmit()