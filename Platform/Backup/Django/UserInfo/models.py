# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models

# Create your models here.
class User(models.Model):
    account = models.CharField(max_length=50)
    password = models.CharField(max_length=20)

    def __str__(self):  # __unicode__ on Python 2
        return 'Account: %s, Password: %s' % (self.account, self.password)
    def __unicode__(self):
        return 'Account: %s, Password: %s' % (self.account, self.password)
