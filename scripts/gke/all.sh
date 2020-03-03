#! /bin/bash
PROJECT=$(gcloud info --format='value(config.project)')

cd ../../nodeCode/app/gke/

docker build -t gcr.io/${PROJECT}/hello-node:v1 .

gcloud auth configure-docker

docker push gcr.io/${PROJECT}/hello-node:v1


gcloud container clusters create hello-world \
                --num-nodes 2 \
                --machine-type n1-standard-1 \
                --zone us-central1-a


kubectl run hello-node \
    --image=gcr.io/${PROJECT}/hello-node:v1 \
    --port=8080

kubectl expose deployment hello-node --type="LoadBalancer"


#! /bin/bash
kubectl scale deployment hello-node --replicas=5