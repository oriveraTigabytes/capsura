#! /bin/bash

PROJECT=$(gcloud info --format='value(config.project)')

kubectl set image deployment/hello-node hello-node=gcr.io/${PROJECT}/hello-node:v1 --record

#kubectl edit deployment hello-node


