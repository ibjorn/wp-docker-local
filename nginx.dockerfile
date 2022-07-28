FROM nginx:stable-alpine

RUN apk --update --no-cache add openssl

# RUN mkdir /etc/nginx/templates

# RUN mkdir -p /etc/nginx/certs/ /etc/nginx/certs/private/
RUN mkdir -p /etc/nginx/certs/ 
# ADD ./nginx/nginx-conf.conf /etc/nginx/conf.d/nginx-conf.conf
# ADD ./nginx/security.conf /etc/nginx/conf.d/security.conf


# ADD ./nginx/default.conf /etc/nginx/conf.d
# ADD ./nginx/certs /etc/nginx/certs/self-signed

# RUN mkdir -p /etc/nginx/certs/
ADD ./nginx/certs /etc/nginx/certs

# RUN mkcert ${DOMAIN} '*.${DOMAIN}' localhost 127.0.0.1 ::1

# RUN mkdir -p /var/www/html