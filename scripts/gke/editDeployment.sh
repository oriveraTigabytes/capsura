#! /bin/bash

PROJECT=$(gcloud info --format='value(config.project)')

kubectl set image deployment/hello-node hello-node=gcr.io/${PROJECT}/hello-node:v1 --record

##To see rollout status
#kubectl rollout status deployment hello-node

#kubectl edit deployment hello-node


##max surge: maximo numero de pods sobre la cantidad de pods deseados. Rounding up
##max unavailable: rounding down

#kubectl get rs