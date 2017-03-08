from django.db import models
#from custom_user.models import EmailUser
from django.contrib.auth.models import User
from datetime import *
from django.template.defaultfilters import slugify
from django.contrib.humanize.templatetags.humanize import *

from django.utils.safestring import mark_safe
from dateutil.relativedelta import relativedelta
import dateutil.parser
import pytz
import os
import re
import uuid
import operator
from pytz import timezone

mytz = pytz.timezone('Asia/Seoul')
    
class Resource(models.Model):
    resource_type=models.CharField(max_length=50,default='Energy', blank=True, db_index=True)
    commodity_type=models.CharField(max_length=50,default='oil', blank=True, db_index=True)

    is_active = models.BooleanField(default=True, db_index=True)
    is_commodity = models.BooleanField(default=False)
    is_public = models.BooleanField(default=False, db_index=True)
    ticker = models.CharField(
        max_length=100, blank=True, db_index=True, null=True)
    exchange = models.CharField(
        max_length=100, blank=True, db_index=True, null=True)
    sec_cik=models.CharField(
        max_length=100, blank=True, db_index=True, null=True)
    sec_cik_int=models.CharField(
        max_length=100, blank=True, db_index=True, null=True)
    
    partner_order = models.IntegerField(default=0)


    company_name = models.CharField(
        max_length=500, blank=True, db_index=True)
    
    last_edited_time = models.DateTimeField(
        'resource date edited', auto_now=True, db_index=True)
    created_time = models.DateTimeField(
        auto_now_add=True, null=True, db_index=True)
    
    def __unicode__(self):
        return self.company_name

class Instrument(models.Model):
    resource=models.ForeignKey(Resource, null=True, db_index=True)
    broker=models.CharField(max_length=255, null=True, db_index=True)
    sym=models.CharField(max_length=255, null=True, db_index=True)
    cur=models.CharField(max_length=255, null=True, db_index=True)
    exch=models.CharField(max_length=255, null=True, db_index=True)
    secType=models.CharField(max_length=255, null=True, db_index=True)
    trade_freq=models.IntegerField(null=True, db_index=True)
    mult=models.FloatField(max_length=255, null=True, db_index=True)
    local_sym=models.CharField(max_length=255, null=True, db_index=True)
    
    contractMonth=models.CharField(max_length=255, null=True, db_index=True)
    expiry=models.CharField(max_length=255, null=True, db_index=True)
    evRule=models.CharField(max_length=255, null=True, db_index=True)
    liquidHours=models.CharField(max_length=255, null=True, db_index=True)
    longName=models.CharField(max_length=255, null=True, db_index=True)
    minTick=models.FloatField(max_length=255, null=True, db_index=True)
    timeZoneId=models.CharField(max_length=255, null=True, db_index=True)
    tradingHours=models.CharField(max_length=255, null=True, db_index=True)
    underConId=models.IntegerField(null=True, db_index=True)
    
    created_at = models.DateTimeField(
        auto_now_add=True, null=True, db_index=True)
    updated_at = models.DateTimeField(
        auto_now_add=True, null=True, db_index=True)
    crawl_source=models.CharField(max_length=200, default='', blank=True, null=True)

    def __unicode__(self):
        return '%s' % self.name

    def save(self, *args, **kwargs):
        eastern=timezone('US/Eastern')
       
        if self.created_at == None:
            self.created_at = datetime.now().replace(tzinfo=eastern)  
        self.updated_at = datetime.now().replace(tzinfo=eastern) 
        
        super(Instrument, self).save(*args, **kwargs)



class System(models.Model):
    #user = models.OneToOneField(User, primary_key=True)
    version= models.CharField(max_length=255, null=True, db_index=True)
    system= models.CharField(max_length=255, null=True, db_index=True)
    name=models.CharField(max_length=255, null=True, db_index=True)
    c2id=models.CharField(max_length=255, null=True, db_index=True)
    c2api=models.CharField(max_length=255, null=True, db_index=True)
    c2qty=models.IntegerField(null=True, db_index=True)
    c2submit=models.BooleanField(default=False)
    c2instrument=models.ForeignKey(Instrument, related_name='c2instrument', null=True, db_index=True)
    ibqty=models.IntegerField(null=True, db_index=True)
    ibinstrument=models.ForeignKey(Instrument, related_name='ibinstrument', null=True, db_index=True)
    ibsubmit=models.BooleanField(default=False)
    trade_freq=models.IntegerField(null=True, db_index=True)
    ibmult=models.IntegerField(null=True, db_index=True)
    c2mult=models.IntegerField(null=True, db_index=True)
    signal=models.CharField(max_length=255, null=True, db_index=True)



class Feed(models.Model):
    instrument=models.ForeignKey(Instrument, db_index=True)
    frequency=models.IntegerField(null=True, db_index=True)
    date=models.DateTimeField(
        null=True, db_index=True)
    open=models.FloatField(null=True)
    high=models.FloatField(null=True)
    low=models.FloatField(null=True)
    close=models.FloatField(null=True)
    change=models.FloatField(null=True)
    settle=models.FloatField(null=True)
    open_interest=models.FloatField(null=True)
    
    volume=models.FloatField(null=True)
    wap=models.FloatField(null=True)
    
    created_at = models.DateTimeField(
        auto_now_add=True, null=True, db_index=True)
    updated_at = models.DateTimeField(
        auto_now_add=True, null=True, db_index=True)
    crawl_source=models.CharField(max_length=200, default='', blank=True, null=True)

    def __repr__(self):
        #return '{ "date":"%s", "open":%s, "high":%s, "low":%s, "close":%s,"volume":%s }' % (self.date, self.open, self.high, self.low, self.close, self.volume)
        return '{ "date":"%s",  "close":%s,"volume":%s }' % (self.date,  self.close, self.volume)
        
    def __str__(self):
        return self.__repr__()
    
    def __unicode__(self):
        return self.__repr__()
    
    def save(self, *args, **kwargs):
        eastern=timezone('US/Eastern')
       
        if self.created_at == None:
            self.created_at = datetime.now().replace(tzinfo=eastern)  
        self.updated_at = datetime.now().replace(tzinfo=eastern)  
        super(Feed, self).save(*args, **kwargs)


class Prediction(models.Model):
    instrument=models.ForeignKey(Instrument, db_index=True)
    frequency=models.IntegerField(null=True, db_index=True)
    pred_start_date=models.DateTimeField(
        null=True, db_index=True)
    
    date=models.DateTimeField(
        null=True, db_index=True)
    open=models.FloatField(null=True)
    high=models.FloatField(null=True)
    low=models.FloatField(null=True)
    close=models.FloatField(null=True)
    volume=models.FloatField(null=True)
    wap=models.FloatField(null=True)
    algo_name=models.CharField(max_length=200, default='', blank=True, null=True)
    is_scaled=models.BooleanField(default=False)
    created_at = models.DateTimeField(
        auto_now_add=True, null=True, db_index=True)
    updated_at = models.DateTimeField(
        auto_now_add=True, null=True, db_index=True)
    crawl_source=models.CharField(max_length=200, default='', blank=True, null=True)

    def __repr__(self):
        #return '{ "date":"%s", "open":%s, "high":%s, "low":%s, "close":%s,"volume":%s }' % (self.date, self.open, self.high, self.low, self.close, self.volume)
        return '{ "date":"%s", "close":%s, "volume":%s }' % (self.date,  self.close, self.volume)
        
    def __str__(self):
        return self.__repr__()
    
    def __unicode__(self):
        return self.__repr__()
    
    def save(self, *args, **kwargs):
        eastern=timezone('US/Eastern')
       
        if self.created_at == None:
            self.created_at = datetime.now().replace(tzinfo=eastern)  
        self.updated_at = datetime.now().replace(tzinfo=eastern)  
        super(Prediction, self).save(*args, **kwargs)


class BidAsk(models.Model):
    instrument=models.ForeignKey(Instrument, db_index=True)
    frequency=models.IntegerField(null=True, db_index=True)
    ask=models.FloatField(null=True)
    asksize=models.FloatField(null=True)
    bid=models.FloatField(null=True)
    bidsize=models.FloatField(null=True)
    date=models.DateTimeField(
        null=True, db_index=True)
    
    created_at = models.DateTimeField(
        auto_now_add=True, null=True, db_index=True)
    updated_at = models.DateTimeField(
        auto_now_add=True, null=True, db_index=True)
    crawl_source=models.CharField(max_length=200, default='', blank=True, null=True)

    def __unicode__(self):
        return '%s' % self.name

    def save(self, *args, **kwargs):
        eastern=timezone('US/Eastern')
       
        if self.created_at == None:
            self.created_at = datetime.now().replace(tzinfo=eastern)  
        self.updated_at = datetime.now().replace(tzinfo=eastern) 
        super(BidAsk, self).save(*args, **kwargs)


