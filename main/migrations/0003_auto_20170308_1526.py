# -*- coding: utf-8 -*-
# Generated by Django 1.9.10 on 2017-03-08 15:26
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0002_auto_20170308_1524'),
    ]

    operations = [
        migrations.RenameField(
            model_name='instrument',
            old_name='contractMonth',
            new_name='contract_month',
        ),
        migrations.RenameField(
            model_name='instrument',
            old_name='evRule',
            new_name='ev_rule',
        ),
        migrations.RenameField(
            model_name='instrument',
            old_name='liquidHours',
            new_name='liquid_hours',
        ),
        migrations.RenameField(
            model_name='instrument',
            old_name='longName',
            new_name='long_name',
        ),
        migrations.RenameField(
            model_name='instrument',
            old_name='minTick',
            new_name='min_tick',
        ),
        migrations.RenameField(
            model_name='instrument',
            old_name='timeZoneId',
            new_name='time_zone_id',
        ),
        migrations.RenameField(
            model_name='instrument',
            old_name='tradingHours',
            new_name='trading_hours',
        ),
        migrations.RenameField(
            model_name='instrument',
            old_name='underConId',
            new_name='under_con_id',
        ),
    ]
