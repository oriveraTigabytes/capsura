#! /bin/bash
PROJECT=$(gcloud info --format='value(config.project)')

##move to app
cd ../../nodeCode/app/gke/

##create image
docker build -t gcr.io/${PROJECT}/hello-node:v1 .

##run image 
##run on localhost:8080

#docker run -d -p 8080:8080 gcr.io/${PROJECT}/hello-node:v1

##process
#docker ps

##stop process
#docker stop

gcloud auth configure-docker

#push to container registry
docker push gcr.io/${PROJECT}/hello-node:v1

#docker documentation: https://docs.docker.com
