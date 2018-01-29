# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.http import HttpResponse
import json
from models import User

from django.http import HttpResponseRedirect
from django.shortcuts import render
from .forms import UploadFileForm

from django.conf import settings
from django.core.files.storage import FileSystemStorage

# Create your views here.
def login(request):
    if request.method == 'GET':
        account = request.GET.get('account')
        password = request.GET.get('password')

        user = User()
        user.account = account
        user.password = password
        user.save()

        response_str = "Login successfully! Account: %s, Password: %s" % (user.account, user.password)
        return HttpResponse(response_str)
        # return HttpResponse("Login Successfully GET!")
    elif request.method == 'POST':
        return HttpResponse("Login Successfully POST!")

def register(request):
    if request.method == 'POST':
        # return HttpResponse("Register Successfully POST!")

        # form = UploadFileForm(request.POST, request.FILES)
        # form = UploadFileForm(request.FILES)
        form = UploadFileForm('abc')
        # form.file = request.FILES
        if form.is_valid():
            return HttpResponse("Valid!")
            # handle_uploaded_file(request.FILES['myfile'])
            # return HttpResponseRedirect('success.html')
        else:
            return HttpResponse("Invalid!")
            form = UploadFileForm()
    # return render(request, 'failure.html', {'form': form})
    return HttpResponse("The End!")

def handle_uploaded_file(f):
    with open('uploaded.txt', 'wb+') as destination:
        for chunk in f.chunks():
            destination.write(chunk)

# def register(request):
#     if request.method == 'POST' and request.FILES['uploaded_file']:
#         uploaded_file = request.FILES['uploaded_file']
#         fs = FileSystemStorage('resource/images/')
#         filename = fs.save(uploaded_file.name, uploaded_file)
#         uploaded_file_url = fs.url(filename)
#         return HttpResponse("Upload successfully")
#     return HttpResponse("Upload unsuccessfully")