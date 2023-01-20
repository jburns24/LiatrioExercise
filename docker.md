System Requirements
* Docker (Tested on Docker version 20.10.21, build baeda1f for Win 10)

1 ) `docker build -t rest-api -f Dockerfile .` this builds an image (like a snapshot of a machine)
2) `docker run -it -p 80:80 --rm rest-api` this creates a container and starts it in interactive mode. Additionally the -p 'publishes' the exposed port and --rm tells the docker daemon to remove the container when stopped (or because of the ENTRYPOINT if the application crashes)

Clean Up
1) Images need to be removed `docker image prune  --force`. Images will be orphaned due to running the flags `-it --rm` on the `docker run` command.