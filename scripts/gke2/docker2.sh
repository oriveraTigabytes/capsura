#! /bin/bash
PROJECT=$(gcloud info --format='value(config.project)')

##create image
docker build -t gcr.io/${PROJECT}/hello-node:v2 .

##run image 
##run on localhost:8080
docker run -d -p 8080:8080 gcr.io/${PROJECT}/hello-node:v2

##process
#docker ps

##stop process
#docker stop

gcloud auth configure-docker

#push to container registry
docker push gcr.io/${PROJECT}/hello-node:v2

#docker documentation: https://docs.docker.com
