#!/usr/bin/env python2
# -*- coding: utf-8 -*-
"""
Created on Sat Mar 18 17:54:31 2017

@author: hidemiasakura
"""

import os
from slackclient import SlackClient


BOT_NAME = 'frankenstein'

#slack_client = SlackClient(os.environ.get('SLACK_BOT_TOKEN'))
SLACK_BOT_TOKEN='xoxb-156360318612-rOsZj0PhdcnBozPfHWBHJiGS'
BOT_ID='U4LAL9CJ0'
slack_client = SlackClient(SLACK_BOT_TOKEN)

def handle_command(command, channel):
    print command
    """
        Receives commands directed at the bot and determines if they
        are valid commands. If so, then acts on the commands. If not,
        returns back what it needs for clarification.
    """
    response = "Not sure what you mean. Use the *" + EXAMPLE_COMMAND + \
               "* command with numbers, delimited by spaces."
    if command.startswith('ping'):
        response = "<@"+command.split()[1]+"> hello"
    
    slack_client.api_call("chat.postMessage", channel=channel,
                          text=response, as_user=True)


def parse_slack_output(slack_rtm_output):
    """
        The Slack Real Time Messaging API is an events firehose.
        this parsing function returns None unless a message is
        directed at the Bot, based on its ID.
    """
    output_list = slack_rtm_output
    if output_list and len(output_list) > 0:
        
        for output in output_list:
            if output and 'text' in output and AT_BOT in output['text']\
                    and output['user'] in operators:
                print output_list
                # return text after the @ mention, whitespace removed
                return output['text'].split(AT_BOT)[1].strip().lower(), \
                       output['channel']
    return None, None

# constants
AT_BOT = "<@" + BOT_ID + ">"
EXAMPLE_COMMAND = "do"

if __name__ == "__main__":
    api_call = slack_client.api_call("users.list")
    members = api_call.get('members')
    users=[(x.get('name'), x.get('id')) for x in members if 'name' in x] 
    print users
    operators=['U3ZQ523QT']
    
    READ_WEBSOCKET_DELAY = 1 # 1 second delay between reading from firehose
    if slack_client.rtm_connect():
        print(BOT_NAME+" connected and running!")
        while True:
            command, channel = parse_slack_output(slack_client.rtm_read())
            if command and channel:
                print channel, command
                handle_command(command, channel)
            time.sleep(READ_WEBSOCKET_DELAY)
    else:
        print("Connection failed. Invalid Slack token or bot ID?")
        
'''
if __name__ == "__main__":
    api_call = slack_client.api_call("users.list")
    if api_call.get('ok'):
        # retrieve all users so we can find our bot
        users = api_call.get('members')
        for user in users:
            if 'name' in user and user.get('name') == BOT_NAME:
                print("Bot ID for '" + user['name'] + "' is " + user.get('id'))
    else:
        print("could not find bot user with the name " + BOT_NAME)
'''