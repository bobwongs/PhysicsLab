# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render

from django.http import HttpResponse
from django.http import HttpResponseRedirect

from django.conf import settings
from django.core.files.storage import FileSystemStorage

import json

from .models import UserInfo
from .forms import UploadFileForm


# Create your views here.
def login(request):
    if request.method == 'POST':
        request_body = request.body.decode('utf-8')
        json_dict = json.loads(request_body)

        account = json_dict['account']
        password = json_dict['password']

        # user_info = UserInfo()
        # user_info.account = account
        # user_info.password = password

        response_dict = {'responseCode': '0', 'responseMsg': 'Success', 'account': account, 'password': password}
        response_str = json.dumps(response_dict)
        # response_str = "Login successfully! Account: %s, Password: %s" % (user_info.account, user_info.password)
        return HttpResponse(response_str)
        # return HttpResponse("Login Successfully GET!")
    return HttpResponse("Not Supported HTTP Method!")


def register(request):
    if request.method == 'POST':
        request_body = request.body.decode('utf-8')
        json_dict = json.loads(request_body)

        account = request_body['account']
        password = request_body['password']
        email = request_body['email']
        gender = request_body['gender']
        age = request_body['age']

        user_info = UserInfo()
        user_info.account = account
        user_info.password = password
        user_info.email = email
        user_info.gender = gender
        user_info.age = age
        user_info.save()

        response_str = "Register successfully! Account: %s, Password: %s" % (user_info.account, user_info.password)
        return HttpResponse(response_str)
        # return HttpResponse("Login Successfully GET!")
    return HttpResponse("Not Supported HTTP Method!")


def reset_password(request):
    return HttpResponse("Reset password")
