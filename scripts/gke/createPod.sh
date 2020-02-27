#! /bin/bash
PROJECT=$(gcloud info --format='value(config.project)')
kubectl run hello-node \
    --image=gcr.io/${PROJECT}/hello-node:v1 \
    --port=8080