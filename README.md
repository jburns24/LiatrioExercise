# System Requirements
- Docker (Tested on `Docker version 20.10.21, build baeda1f`)
- Python3 (Tested on `Python 3.9.13`)
- Kubernetes (Tested on windows platform Client v1.26, linux platform Server v1.25, Kustomize v4.5.7)

## Python3
- `pip install -r requirements.txt`
- make sure the Scripts directory is on your path and the command `fab --version`.

# How to build and deploy
run `fab build` (currently this will rebuild the image and start an interactive container)