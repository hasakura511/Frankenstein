import requests
from time import gmtime, strftime, time, localtime, sleep
import json
from pandas.io.json import json_normalize
import numpy as np
import pandas as pd
import time
import logging
import os
import requests
import sqlite3



        
def place_order(dbPath, action, quant, sym, type, systemid, submit,apikey, parentsig=None):
    #conn = sqlite3.connect(dbPath)
    #sigid=int(pd.read_sql('select * from c2sigid', con=conn).iloc[-1])
    if submit == False:
        return 0;
    url = 'https://collective2.com/world/apiv2/submitSignal'
    
    headers = {'content-type': 'application/json', 'Accept-Charset': 'UTF-8'}
    #sigid=int(sigid)+1
    parentsig= "" if parentsig==None else parentsig
    data = { 
    		"apikey":   apikey, # "tXFaL4E6apdfmLtGasIovtGnUDXH_CQso7uBpOCUDYGVcm1w0w", 
    		"systemid": systemid, 
    		"signal":{ 
    	   		"action": action, 
    	   		"quant": quant, 
    	   		"symbol": sym, 
    	   		"typeofsymbol": type, 
    	   		"market": 1, 	#"limit": 31.05, 
    	   		"duration": "DAY", 
               "signalid": "",
               "conditionalupon": parentsig
    		} 
    	}
    #logging.info( 'sigid is: ' + str( sigid ))
    #dataf=pd.DataFrame([[sigid]], columns=['sigid'])
    #dataf.to_sql(name='c2sigid',con=conn,if_exists='replace', index=False)
    params={}
    
    r=requests.post(url, params=params, json=data);
    #sleep(2)
    print r.text
    logging.info( str(r.text)  )
    return r.json()['signalid']

    
def set_position(positions, systemid, submit, apikey):
    if submit == False:
        return 0;
    url = 'https://api.collective2.com/world/apiv3/setDesiredPositions'
    
    headers = {'content-type': 'application/json', 'Accept-Charset': 'UTF-8'}
    
    data = { 
          "apikey":   apikey, # "tXFaL4E6apdfmLtGasIovtGnUDXH_CQso7uBpOCUDYGVcm1w0w", 
          "systemid": str(systemid), 
          "positions": positions
          #{
          #   "symbol" : "MSFT",
          #   "typeofsymbol" : "stock",
          #   "quant" : -30
          #},
          # {
          #    "symbol" : "@ESH6",
          #    "typeofsymbol" : "future",
          #   "quant" : 1
          # }
          #
          #
    }
    
    params={}
    
    r=requests.post(url, params=params, json=data);
    sleep(2)
    #print r.text
    logging.info( str(r.text)  )
    return str(r.text)
    
def flat_position(systemid, submit, apikey):
    if submit == False:
        return 0;
    url = 'https://api.collective2.com/world/apiv3/setDesiredPositions'
    
    headers = {'content-type': 'application/json', 'Accept-Charset': 'UTF-8'}
    
    data = { 
          "apikey":   apikey, # "tXFaL4E6apdfmLtGasIovtGnUDXH_CQso7uBpOCUDYGVcm1w0w", 
          "systemid": str(systemid), 
          "positions": [
					{ 
						"symbol"  : "flat",
						"typeofsymbol"  : "flat",
						"quant"  : "0"
					}

				]
          #{
          #   "symbol" : "MSFT",
          #   "typeofsymbol" : "stock",
          #   "quant" : -30
          #},
          # {
          #    "symbol" : "@ESH6",
          #    "typeofsymbol" : "future",
          #   "quant" : 1
          # }
          #
          #
    }
    
    params={}
    
    r=requests.post(url, params=params, json=data);
    sleep(2)
    #print r.text
    logging.info( str(r.text)  )
    return str(r.text)

    
def retrieveSignalsWorking(systemid, apikey):
    url = 'https://collective2.com/world/apiv3/retrieveSignalsWorking'
    headers = {'content-type': 'application/json', 'Accept-Charset': 'UTF-8'}
    
    data={
        "systemid" : str(systemid),
        "apikey" : str(apikey)
        }
    
    params={}
    
    r=requests.post(url, params=params, json=data);
    #print r.text
    logging.info(r.text)
    return r.text
    
def retrieveSystemEquity(systemid, apikey, commission_plan='default'):
    url = 'https://api.collective2.com/world/apiv3/retrieveSystemEquity'
    headers = {'content-type': 'application/json', 'Accept-Charset': 'UTF-8'}
    
    data={
       "commission_plan" : commission_plan,
       "systemid" : str(systemid),
       "apikey" : str(apikey)
        }
    
    params={}
    
    r=requests.post(url, params=params, json=data);
    #print r.text
    logging.info(r.text)
    return r.text
    
def getSystemDetails(systemid, apikey):
    url = 'https://api.collective2.com/world/apiv3/getSystemDetails'
    headers = {'content-type': 'application/json', 'Accept-Charset': 'UTF-8'}
    
    data={
       #"commission_plan" : commission_plan,
       "systemid" : str(systemid),
       "apikey" : str(apikey)
        }
    
    params={}
    
    r=requests.post(url, params=params, json=data);
    #print r.text
    logging.info(r.text)
    return r.text
    
def requestTrades(systemid, apikey):
    url = 'https://collective2.com/world/apiv3/requestTrades'
    headers = {'content-type': 'application/json', 'Accept-Charset': 'UTF-8'}
    data = { 
    		"apikey":   str(apikey),#"tXFaL4E6apdfmLtGasIovtGnUDXH_CQso7uBpOCUDYGVcm1w0w", 
    		"systemid": str(systemid)
          }
    params={}
    r=requests.post(url, params=params, json=data);
    #print r.text
    logging.info(r.text)
    return r.text


def requestTradesOpen(systemid, apikey):
    url = 'https://collective2.com/world/apiv3/requestTradesOpen'
    headers = {'content-type': 'application/json', 'Accept-Charset': 'UTF-8'}
    data = { 
    		"apikey":   str(apikey),    #"tXFaL4E6apdfmLtGasIovtGnUDXH_CQso7uBpOCUDYGVcm1w0w", 
    		"systemid": str(systemid)
          }
    
    params={}
    
    r=requests.post(url, params=params, json=data);
    #print r.text
    logging.info(r.text)
    return r.text
