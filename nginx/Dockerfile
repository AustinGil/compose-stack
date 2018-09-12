FROM nginx:latest

# Pull args out of docker-compose.yml
ARG domain
ARG response

COPY ./template.conf /etc/nginx
RUN sed -i -e "s,TARGET_DOMAIN,$domain,g;s,ROOT_RESPONSE,$response,g" /etc/nginx/template.conf && mv /etc/nginx/template.conf /etc/nginx/nginx.conf
