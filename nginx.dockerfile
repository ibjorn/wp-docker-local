FROM nginx:stable-alpine

# RUN mkdir /etc/nginx/templates
ADD ./nginx/nginx-conf.conf /etc/nginx/conf.d/nginx-conf.conf
ADD ./nginx/security.conf /etc/nginx/conf.d/security.conf
# ADD ./nginx/default.conf /etc/nginx/conf.d
# ADD ./nginx/certs /etc/nginx/certs/self-signed
ADD ./nginx/certs /etc/nginx/certs

# RUN mkdir -p /var/www/html