from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^Login/', views.login),
    url(r'^Register/', views.register),
]