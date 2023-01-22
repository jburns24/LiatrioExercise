# System Requirements
- Docker (Tested on `Docker version 20.10.21, build baeda1f`)
- Python3 (Tested on `Python 3.9.13`)
- Kubernetes (Tested on windows platform Client v1.26, linux platform Server v1.25, Kustomize v4.5.7)
- [aws cli](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) (version: aws-cli/2.9.17)
- [Configure the aws cli](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html)

## Python3
- `pip install -r requirements.txt`
- make sure the Scripts directory is on your path and the command `fab --version`.

# How to build and deploy
run `fab build` (currently this will rebuild the image and start an interactive container)