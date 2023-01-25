# DevOps Technical Exercise
This repo is a demo of how one could deploy a highly available, scalable REST api in modern cloud infrastructure.

## Table of contents
- [DevOps Technical Exercise](#devops-technical-exercise)
  - [Table of contents](#table-of-contents)
    - [System Requirements](#system-requirements)
    - [Setup](#setup)
    - [How to build](#how-to-build)
    - [How to deploy](#how-to-deploy)
    - [Clean up](#clean-up)

### System Requirements
- Docker (Tested on `Docker version 20.10.21, build baeda1f`)
- Python3 (Tested on `Python 3.9.13`)
- Kubernetes (Tested on windows platform Client v1.26, linux platform Server v1.25, Kustomize v4.5.7)
- aws cli (version: aws-cli/2.9.17)
- [Configure the aws cli](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html)
- Terraform (tested on version 1.3.7)

### Setup
1) [Install Python3](https://www.python.org/downloads/)
2) [Install Docker](https://docs.docker.com/get-docker/)
3) [Install Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
4) [Install Kubernetes](https://kubernetes.io/docs/setup/)
5) [Install aws cli](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
6) [Configure the aws cli](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html)
7) create a venv `python3 -m venv myenv`
8) activate venv `./myenv/scripts/activate`
9) run `pip install -r ./requirements.txt`

### How to build
```
$ fab tag:v1.0.1 build_image
```
This command will build a docker image of the dotnet app located in the `./App` directory and tag the image with `v1.0.1`. The build is a multi-stage build done to reduce the final image size to just the bare bones. In the first phase of the build unit tests are ran ensuring a new image will get built only when unit tests pass. The second phase of the build copies the published build into a lightweight container and sets the container entry point to the REST api.

_If you have a private repo_
```
$ fab tag:v1.0.2 publish
```
Is an extra command that by default pushes to the public docker hub jburns24. This requires that you have configured your docker cli to point to the `jburns24` docker hub account.

### How to deploy

### Clean up
1) `docker rmi jburns24/rest-api:<version>` Removes the docker image