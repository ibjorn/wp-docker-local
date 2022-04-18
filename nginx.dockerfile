FROM nginx:stable-alpine

RUN mkdir /etc/nginx/templates
# ADD ./nginx/default.conf /etc/nginx/conf.d/default.conf
ADD ./nginx/default.conf.template /etc/nginx/templates
ADD ./nginx/certs /etc/nginx/certs/self-signed

RUN mkdir -p /var/www/html