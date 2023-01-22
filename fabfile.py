import sys, time
from os.path import dirname, join, isfile

from fabric.api import *
from fabric.colors import *
from fabric.contrib.console import confirm
from fabric.contrib import files
from fabric.utils import abort

env.repository = 'localhost:5000'

@task
@runs_once
def build_image():
    local(f'docker build -t {env.repository}/rest-api:v1.0.0 -f Dockerfile .')

@task
@runs_once
def start_registry():
    local('docker run -d -p 5000:5000 --name registry registry:2')

@task
@runs_once
def start_container():
    local(f'docker run -it -p 80:80 --rm {env.repository}/rest-api:v1.0.0')

@task
@runs_once
def push_image():
    local(f'docker push {env.repository}/rest-api:v1.0.0')

@task
@runs_once
def stop_registry():
    local('docker container stop registry')
    local('docker container rm -v registry')

@task
@runs_once
def all_the_things():
    execute('start_registry')
    execute('build_image')
    execute('push_image')

@task
@runs_once
def clean_up():
    execute('stop_registry')
    local('docker rmi registry:2')
    local(f'docker rmi {env.repository}/rest-api:v1.0.0')

@task
@runs_once
def hub():
    env.repository = 'jburns24'

# Currently unused might have to use this for deploying to an EKS node.
# @task
# @runs_once
# def allow_insecure_repository():
#     from sys import platform
#     from os.path import exists
#     json = '''
# {
#   "insecure-registries" : ["myregistrydomain.com:5000"]
# }
#     '''
#     path = 'C:\ProgramData\docker\config\daemon.json' if platform == 'win32' else '/etc/docker/daemon.json'

#     if exists(path):
#         local(f"echo {json} >> path")
#     else:
#         exit(f"Could not locate daemon.json to accept insecure local registry. Looked in {path}")

