#!/bin/bash

set -e

LINK_LOCATION=/certs/latest

function fail () {
	(>&2 echo $@)
	exit 1
}

function certbot_init () {
	[ -n "${EMAIL}" ] || fail "⛔ EMAIL environment variable missing ⛔"
	[ -n "${DOMAINS}" ] || fail "⛔ DOMAINS environment variable missing ⛔"

	# expand ${DOMAINS} and replace whitespace with commas.
	DOMAINS=$(eval echo $DOMAINS | sed -e "s| \+|,|g")

	echo "🔐 Requesting initial certificate for ${DOMAINS} 🔐"

	# Add --staging for testing purposes
	# Add --force-renewal to force a renewal
	certbot certonly --webroot -w /var/lib/certbot/ --agree-tos --non-interactive --text -d "$DOMAINS" --email "$EMAIL"
}

function certbot_renew () {
	echo "⏰ Renewing existing certificate ⏰"
	certbot renew
}
function certbot_start () {
	[ -d /etc/letsencrypt/live ] && certbot_renew || certbot_init
}

function symlink () {
	LATEST=$(ls -td1 /etc/letsencrypt/live/* | head -n1)
	echo "Using live directory: ${LATEST}"
	rm -f ${LINK_LOCATION}
	ln -sf ${LATEST} ${LINK_LOCATION}
}

function reload_nginx () {
	echo "🔃 Reloading nginx 🔃"
	nginx -s reload
}

certbot_start
symlink
reload_nginx
