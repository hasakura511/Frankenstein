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
from os import listdir, remove
from os.path import isfile, join
import datetime
from datetime import datetime as dt
import scripts.iqfeed.dbhist as dbhist
import slackweb
fulltimestamp=datetime.datetime.now().strftime('%Y%m%d_%H_%M_%S')
slackhook='https://hooks.slack.com/services/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'
slack = slackweb.Slack(url=slackhook)
channel="#logs"
c2id = "110064634"
c2key = "aQWcUGsCEMPTUjuogyk8G5qb3pk4XM6IG5iRdgCnKdWLxFVjeF"
typeofsymbol = "stock"
duration = "DAY"
dataPath = './data/'
portfolioPath=dataPath+c2id+'/'

def getDesiredPositions():
    global c2id
    global c2key
    url = 'https://api.collective2.com/world/apiv3/getDesiredPositions'
    headers = {'content-type': 'application/json', 'Accept-Charset': 'UTF-8'}

    data = {
        "systemid": str(c2id),
        "apikey": str(c2key)
    }

    params = {}

    r = requests.post(url, params=params, json=data);
    # print r.text
    #logging.info(r.text)
    return json.loads(r.text)

def retrieveSystemEquity(commission_plan='default'):
    global c2id
    global c2key
    url = 'https://api.collective2.com/world/apiv3/retrieveSystemEquity'
    headers = {'content-type': 'application/json', 'Accept-Charset': 'UTF-8'}

    data = {
        "commission_plan": commission_plan,
        "systemid": str(c2id),
        "apikey": str(c2key)
    }

    params = {}

    r = requests.post(url, params=params, json=data);
    # print r.text
    #logging.info(r.text)
    return json.loads(r.text)

def setDesiredPositions(orders):
    global c2id
    global c2key
    global type
    url = 'https://collective2.com/world/apiv3/setDesiredPositions'
    headers = {'content-type': 'application/json', 'Accept-Charset': 'UTF-8'}

    data = {
            "apikey":   c2key,
            "systemid": c2id,
            "positions": orders,
            }
    params = {}
    r = requests.post(url, params=params, json=data);
    # sleep(2)
    print r.text
    slack.notify(text=r.text, channel=channel, username="frankenstein", icon_emoji=":robot_face:")
    # logging.info(str(r.text))
    #return r.json()['signalid']

if __name__ == "__main__":
    start_time = time.time()
    print 'MARKET IS CLOSING. CLEARING POSITIONS!'
    orders = []
    positions = [x for x in listdir(portfolioPath) if x[-4:]=='json']
    for position in positions:
        filename = portfolioPath + position
        with open(filename, 'r') as f:
            order = json.load(f)

        order['quant'] = 0
        orders.append(order)
        remove(filename)
        print 'removed', filename
        #with open(filename, 'w') as f:
        #    json.dump(order, f)
        #    print 'Saved', filename, 'with qty 0'


    print orders
    print len(orders)
    slack.notify(text='Closing Positions.\n'+str(orders), channel=channel, username="frankenstein", icon_emoji=":robot_face:")
    setDesiredPositions(orders)
    print 'sent orders to broker'
    # frank.run()
    open_positions = str(getDesiredPositions()['response'])
    last_equity = str(retrieveSystemEquity()['equity_data'][-1]['strategy_with_cost'])
    txt = 'Open Positions\n'+open_positions+'\n'
    txt += 'Account Value: '+last_equity +'\n'
    txt += str(dt.now()) + "\nFrank your bill is coming in the mail."
    slack.notify(text=txt, channel=channel, username="frankenstein", icon_emoji=":robot_face:")
    print 'Elapsed time: ', round(((time.time() - start_time) / 60), 2), ' minutes ', dt.now()
