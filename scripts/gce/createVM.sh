#! /bin/bash
PROJECT=$(gcloud info --format='value(config.project)')

gcloud compute instances create my-app-instance \
    --image-family=debian-9 \
    --image-project=debian-cloud \
    --machine-type=g1-small \
    --scopes userinfo-email,cloud-platform \
    --metadata app-location=$DEPLOY_LOCATION \
    --metadata-from-file startup-script=startupscript.sh \
    --zone us-central1-f \
    --tags http-server