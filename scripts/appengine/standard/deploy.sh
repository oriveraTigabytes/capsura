#!/bin/bash
cd ../../../nodeCode/app/appengine/standard/
gcloud app deploy --version='my-node-app' --no-promote app.yaml