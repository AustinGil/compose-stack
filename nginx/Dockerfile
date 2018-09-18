FROM nginx:alpine

# Pull args out of docker-compose.yml
ARG domain
# ARG response

COPY ["./nginx.conf", "./conf.d/", "./etc/nginx/"]
# COPY ./default.conf /etc/nginx/conf.d/default.conf
# RUN sed -i -e "s,TARGET_DOMAIN,$domain,g;s,ROOT_RESPONSE,$response,g" /etc/nginx/template.conf && mv /etc/nginx/template.conf /etc/nginx/nginx.conf

RUN echo "📥 Installing dependencies" \
	apk update && apk upgrade \
	&& apk add --no-cache --no-progress \
	bash \
	openssl \
	git \
	certbot \
	&& echo "🛠 Preparing certbot webroot" \
	# /data/letsencrypt/
	&& mkdir -p /var/lib/certbot \
	&& echo "📝 Generating initial self-signed certificate" \
	&& mkdir -p /data/certs/$domain/ \
	&& openssl req -x509 -nodes -newkey rsa:4096 \
	-keyout "/data/certs/$domain/privkey.pem" \
	-out "/data/certs/$domain/cert.pem" \
	-subj "/C=/ST=/L=/O=/CN=$domain" \
	&& ln -sf /data/certs/$domain /data/certs/latest

# 🛡
# COPY ["./certbot.sh", "../.env", "/"]
# RUN bash -c "bash /certbot.sh"
COPY certbot.sh /
# RUN /certbot.sh
