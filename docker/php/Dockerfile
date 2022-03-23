FROM php:7.4-fpm

#Install xdebug
RUN pecl install xdebug \
    && docker-php-ext-enable xdebug

ADD conf.d/xdebug.ini $PHP_INI_DIR/conf.d/zz-xdebug.ini
ADD conf.d/error_reporting.ini $PHP_INI_DIR/conf.d/error_xdebug.ini

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer


