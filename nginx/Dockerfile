FROM nginx:alpine

# Pulls domain from docker-compose.yml
ARG domain
ARG certs=/certs/temp

COPY certbot.sh /bin

RUN echo "📥 Installing dependencies 📥" \
	&& apk update && apk upgrade \
	&& apk add --no-cache --no-progress \
	bash \
	openssl \
	git \
	certbot \
	&& echo "📁 Creating certs and certbot webroot folders 📁" \
	&& mkdir -p /var/lib/certbot \
	&& mkdir -p $certs \
	&& echo "🔏 Generating temporary self-signed certificate 🔏" \
	&& openssl req -x509 -nodes -newkey rsa:4096 \
	-keyout "$certs/privkey.pem" \
	-out "$certs/fullchain.pem" \
	-subj "/C=/ST=/L=/O=/CN=$domain" \
	&& echo "🔁 Creating symlink for latest certs 🔁" \
	&& ln -sf $certs /certs/latest

