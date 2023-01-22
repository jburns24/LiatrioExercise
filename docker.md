System Requirements
* Docker (Tested on Docker version 20.10.21, build baeda1f for Win 10)

## Steps
1) `docker run -d -p 5000:5000 --name registry registry:2` -> starts docker container for a local docker registry. This runs in daemon mode and publishes port 5000. (not sure what about this command configures the volume. Maybe that is contained in the image)
2) `docker build -t localhost:5000/rest-api:remote -f Dockerfile .` this builds an image (like a snapshot of a machine) names it 'localhost:5000/rest-api' and tags it 'remote'
3) `docker push localhost:5000/rest-api:remote` -> push to local repository
4) `docker run -it -p 80:80 --rm localhost:5000/rest-api:remote` this creates a container and starts it in interactive mode. Additionally the -p 'publishes' the exposed port and --rm tells the docker daemon to remove the container when stopped (or because of the ENTRYPOINT if the application crashes)

Clean Up
1) Images need to be removed `docker image prune  --force`. Images will be orphaned due to running the flags `-it --rm` on the `docker run` command. Should be noted this will delete all orphaned images (probably should revisit this to only remove the image associated with the container that was stopped).
2) `docker container stop registry && docker container rm -v registry` Stop the container 'registry' and delete the persistent data associated to that volume