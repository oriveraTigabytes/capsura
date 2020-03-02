#! /bin/bash
cd ../../nodeCode/app/gcf

gcloud functions deploy helloWorld --trigger-http

#--trigger-topic, --trigger-bucket, --trigger-http, --trigger-event