FROM nginx:alpine

# Pull args out of docker-compose.yml
ARG domain
ARG response

COPY ["./nginx.conf", "./conf.d/", "./etc/nginx/"]
COPY certbot.sh /
# COPY ./default.conf /etc/nginx/conf.d/default.conf
RUN sed -i -e "s,ROOT_RESPONSE,$response,g" /etc/nginx/conf.d/default.conf

RUN echo "📥📥📥 Installing dependencies" \
	apk update && apk upgrade \
	&& apk add --no-cache --no-progress \
	bash \
	openssl \
	git \
	certbot \
	&& echo "🛠🛠🛠 Preparing certbot webroot" \
	&& mkdir -p /var/lib/certbot \
	&& echo "📝📝📝 Generating initial self-signed certificate" \
	&& mkdir -p /data/certs/$domain \
	# && mkdir -p /etc/letsencrypt/live/$domain/ \
	&& openssl req -x509 -nodes -newkey rsa:4096 \
	# -keyout "/etc/letsencrypt/live/$domain/privkey.pem" \
	# -out "/etc/letsencrypt/live/$domain/fullchain.pem" \
	# -subj "/C=/ST=/L=/O=/CN=$domain"
	-keyout "/data/certs/$domain/privkey.pem" \
	-out "/data/certs/$domain/fullchain.pem" \
	-subj "/C=/ST=/L=/O=/CN=$domain"
# && ln -sf /etc/nginx/ssl/$domain /etc/nginx/ssl/latest
# && ln -sf /data/certs/$domain /etc/letsencrypt/live/$domain

