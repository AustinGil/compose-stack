FROM nginx:alpine

# Pulls domains from docker-compose.yml
ARG certs_dir=/certs/temp

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
	&& mkdir -p $certs_dir \
	&& echo "🔏 Generating temporary self-signed certificate 🔏" \
	&& openssl req -x509 -nodes -newkey rsa:4096 \
	-keyout "$certs_dir/privkey.pem" \
	-out "$certs_dir/fullchain.pem" \
	-subj "/C=/ST=/L=/O=/CN=arbitrary.com" \
	&& echo "🔁 Creating symlink for latest certs 🔁" \
	&& ln -sf $certs_dir /certs/latest

