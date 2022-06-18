FROM php:7.4-fpm

# Install dependencies
RUN apt-get update \
  && apt-get install -y \
  # dependency for zip
    libzip-dev

#Install mysqli
RUN docker-php-ext-install mysqli \
    zip

RUN docker-php-ext-enable mysqli

#Install xdebug
RUN pecl install xdebug \
    && docker-php-ext-enable xdebug

RUN pecl install pcov \
    && docker-php-ext-enable pcov

# Install unzip
RUN apt-get update && apt-get install -y unzip

ADD conf.d/xdebug.ini $PHP_INI_DIR/conf.d/zz-xdebug.ini
ADD conf.d/error_reporting.ini $PHP_INI_DIR/conf.d/error_xdebug.ini

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer


