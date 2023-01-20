import sys, time
from os.path import dirname, join, isfile

from fabric.api import *
from fabric.colors import *
from fabric.contrib.console import confirm
from fabric.contrib import files
from fabric.utils import abort

@task
@runs_once
def build():
    local('docker build -t rest-api -f Dockerfile .')
    local('docker run -it -p 80:80 --rm rest-api')