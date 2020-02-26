#!/bin/bash
cd ../../../nodeCode/app/standard/
gcloud app deploy --version='my-node-app' --no-promote app.yaml