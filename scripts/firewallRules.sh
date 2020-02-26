gcloud compute firewall-rules create allow-app \
    --allow tcp:8000 \
    --source-ranges 0.0.0.0/0 \
    --target-tags http-server \
    --description "Allow port 80 access to http-server"