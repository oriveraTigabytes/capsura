#!/bin/bash
cd ../../../nodeCode/app/appengine/flexible/
gcloud app deploy --version='my-node-app-flex' --no-promote app.yaml