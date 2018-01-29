# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models


# Create your models here.
class UserInfo(models.Model):
    # id
    account = models.CharField(max_length=50)
    password = models.CharField(max_length=20)
    email = models.CharField(max_length=20)
    gender = models.CharField(max_length=10)
    age = models

    def __str__(self):  # __unicode__ on Python 2
        return 'Account: %s, Password: %s' % (self.account, self.password)

    def __unicode__(self):
        return 'Account: %s, Password: %s' % (self.account, self.password)


class LoginInfo(models.Model):
    # account_id = models
    token = models.CharField(max_length=20)
