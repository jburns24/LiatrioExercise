from fabric.api import *
from fabric.colors import green

env.repository = 'jburns24'

@task
@runs_once
def add_eks_to_kubeconfig():
    with lcd('./eks-cluster-tf'):
        region = local('terraform output -raw region', capture=True)
        cluster_name = local('terraform output -raw cluster_name', capture=True)
        local(f'aws eks --region {region} update-kubeconfig --name {cluster_name}')

@task
@runs_once
def apply():
    with lcd('./eks-cluster-tf'):
        local('terraform apply -auto-approve')
        with lcd('./kubernetes-tf'):
            local(f'terraform apply -var tag={env.tag} -auto-approve')
            endpoint = local('terraform output -raw service_endpoint', capture=True)
            print()
            print(green(f'Great success!!\nhttp://{endpoint}'))

@task
@runs_once
def destroy():
    with lcd('./eks-cluster-tf/kubernetes-tf'):
        local('terraform destroy -auto-approve')
    with lcd('./eks-cluster-tf'):
        local('terraform destroy -auto-approve')

@task
@runs_once
def build_image():
    local(f'docker build -t {env.repository}/rest-api:{env.tag} -f Dockerfile .')

@task
@runs_once
def start_registry():
    local('docker run -d -p 5000:5000 --name registry registry:2')

@task
@runs_once
def start_container():
    local(f'docker run -it -p 80:80 --rm {env.repository}/rest-api:{env.tag}')

@task
@runs_once
def push_image():
    local(f'docker push {env.repository}/rest-api:{env.tag}')

@task
@runs_once
def stop_registry():
    local('docker container stop registry')
    local('docker container rm -v registry')

@task
@runs_once
def publish():
    execute('build_image')
    execute('push_image')

@task
@runs_once
def clean_up():
    execute('stop_registry')
    local('docker rmi registry:2')
    local(f'docker rmi {env.repository}/rest-api:{env.tag}')

@task
@runs_once
def tag(version='v1.0.0'):
    env.tag = version

@task
@runs_once
def loc():
    env.repository = 'localhost:5000'

