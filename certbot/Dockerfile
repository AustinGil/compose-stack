FROM certbot/certbot

COPY ./certbot/scripts /root/scripts/

RUN apk add --no-cache bash

# Runs cert commands and keeps container up
ENTRYPOINT bash -c "bash /root/scripts/run-certbot.sh && while sleep 3600; do :; done"
