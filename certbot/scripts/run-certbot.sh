#!/bin/bash

# Run certbot to get cert
# Add --staging for testing purposes
# Add --force-renewal to force a renew
certbot certonly --webroot -w /data/letsencrypt --agree-tos --non-interactive --text -d "$DOMAIN" --email "$EMAIL"

# Create directory with domain name within shared volume
mkdir -p /data/certs/"$DOMAIN"
# Move cert files to shared volume at folder name
cp /etc/letsencrypt/live/"$DOMAIN"/{cert.pem,privkey.pem,chain.pem,fullchain.pem} "$_"
