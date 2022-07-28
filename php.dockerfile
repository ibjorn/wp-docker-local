FROM php:8.0.15-fpm

RUN touch /var/log/error_log

ADD ./config/www.conf /usr/local/etc/php-fpm.d/www.conf
ADD ./config/php.ini /usr/local/etc/php/conf.d/php.ini
ADD ./config/phpmyadmin.ini /usr/local/etc/php/conf.d/phpmyadmin.ini

RUN apk --no-cache add shadow && usermod -u 1000 www-data

# RUN groupadd -g 1000 wp && adduser -D wp
# RUN groupadd --force -g 1000 wp
# RUN useradd -ms /bin/bash --no-user-group -g 1000 -u 1337 wp

# RUN groupadd wp
# RUN useradd -g group -G wp wp

# RUN adduser wp
# RUN usermod -a -G wp, www wp
# 
# RUN addgroup wp
# RUN adduser wp wp

# RUN mkdir -p /var/www/html

# RUN chown wp:wp /var/www/html
# RUN chown -vR :wp /var/www/html
# RUN chmod -vR g+w /var/www/html

# WORKDIR /var/www/html

##
# Lightweight version
# For more extensions, comment out line below, and uncomment the 3 RUN commands below
RUN docker-php-ext-install mysqli pdo pdo_mysql && docker-php-ext-enable pdo_mysql
##

# RUN docker-php-ext-install mysqli pdo pdo_mysql bcmath exif && docker-php-ext-enable pdo_mysql bcmath exif
#
# RUN set -ex \
#     && apk add --no-cache --virtual .phpize-deps $PHPIZE_DEPS imagemagick-dev libtool \
#     && export CFLAGS="$PHP_CFLAGS" CPPFLAGS="$PHP_CPPFLAGS" LDFLAGS="$PHP_LDFLAGS" \
#     && pecl install imagick-3.4.3 \
#     && docker-php-ext-enable imagick \
#     && apk add --no-cache --virtual .imagick-runtime-deps imagemagick \
#     && apk del .phpize-deps
#
RUN apk add --no-cache libpng libpng-dev less && docker-php-ext-install gd && apk del libpng-dev

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp