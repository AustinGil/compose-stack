FROM certbot/certbot

COPY certbot/entrypoint.sh /root/scripts/

RUN apk add --no-cache bash

# Runs cert commands and keeps container up
ENTRYPOINT bash -c "bash /root/scripts/entrypoint.sh && while sleep 3600; do :; done"
