from subprocess import Popen, PIPE, check_output
import time
import pandas as pd
import threading
from datetime import datetime as dt
import datetime
import slackweb
fulltimestamp=datetime.datetime.now().strftime('%Y%m%d_%H_%M_%S')
slackhook='https://hooks.slack.com/services/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'
slack = slackweb.Slack(url=slackhook)
start_time = time.time()


def runThreads(threadlist):
    def runInThread(sym, popenArgs):
        print 'starting thread for', sym
        log_filename=logPath + sym + '_'+fulltimestamp+'.log'
        errorlog_filename=logPath + sym + '_' + fulltimestamp +'_error.log'
        with open(log_filename, 'w') as f:
            with open(errorlog_filename, 'w') as e:
                proc = Popen(popenArgs, stdout=f, stderr=e)
                proc.wait()
                f.flush()
                e.flush()
                print sym, 'Done!'
                # check_output(popenArgs)
                # proc2= Popen(popenArgs2, stdout=f, stderr=e)
                # proc2.wait()
                # proc_orders(sym)

        with open(errorlog_filename,'r') as f:
            txt=error_logfilename+'\n'+f.read()
            slack.notify(text=txt, channel="#frankenstein", username="frankenstein", icon_emoji=":sushi:")
        return

    threads = []
    for arg in threadlist:
        # print arg
        t = threading.Thread(target=runInThread, args=arg)
        threads.append(t)

        # Start all threads
    for x in threads:
        x.start()

        # Wait for all of them to finish
    for x in threads:
        x.join()


logPath = './logs/'
stocks = pd.read_csv('stocks.csv')
runPath = './frankenstein.py'
threadlist = [['d:/anaconda2/python',runPath]+[str(y) for y in stocks.ix[x]] for x in stocks.index]
threadlist = [(t[2],t) for t in threadlist]
print len(threadlist), 'threads found..'
runThreads(threadlist)
print 'Elapsed time: ', round(((time.time() - start_time) / 60), 2), ' minutes ', dt.now()
