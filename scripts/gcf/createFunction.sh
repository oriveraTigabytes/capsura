#! /bin/bash
cd ../../nodeCode/app/gcf

gcloud functions deploy helloWorld --trigger-http --runtime nodejs10

#--trigger-topic, --trigger-bucket, --trigger-http, --trigger-event