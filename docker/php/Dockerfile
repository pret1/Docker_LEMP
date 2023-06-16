FROM php:8.1-fpm

# Install dependencies
RUN apt-get update \
  && apt-get install -y \
  # dependency for zip
    libzip-dev

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ssh \
    libssl-dev \
    zlib1g-dev \
    git \
    zip \
    unzip \
    netcat-traditional \
    gnupg \
    libbz2-dev \
    libxml2-dev \
    libpq-dev \
    libzip-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    dnsutils \
    iputils-ping

RUN pecl install apcu redis

#Install mysqli
RUN docker-php-ext-install mysqli \
    zip

RUN docker-php-ext-enable mysqli

#Install xdebug
RUN pecl install xdebug \
    && docker-php-ext-enable xdebug

RUN pecl install pcov \
    && docker-php-ext-enable pcov

WORKDIR /var/www/html

# Install MySQL driver for PDO
RUN docker-php-ext-configure pdo_mysql --with-pdo-mysql=mysqlnd
RUN docker-php-ext-configure gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/
RUN docker-php-ext-install -j$(nproc) \
    soap \
    bz2 \
    zip \
    opcache \
    intl \
    pdo \
    pdo_mysql \
    gd

RUN docker-php-ext-enable apcu pdo_mysql redis


# Install unzip
RUN apt-get update && apt-get install -y unzip

# install node.js
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get install -y nodejs

ADD conf.d/xdebug.ini $PHP_INI_DIR/conf.d/zz-xdebug.ini
ADD conf.d/error_reporting.ini $PHP_INI_DIR/conf.d/error_xdebug.ini

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN apt-get -y update
RUN apt-get -y install git

RUN git config --global user.email "konovsc@gmail.com" \
    && git config --global user.name "konovsc"

RUN groupadd -g 1552200513 yii
RUN useradd --no-log-init -d /home/yii -s /bin/bash -u 1552265627 -g 1552200513 yii
RUN echo "yii:yii" | chpasswd && adduser yii sudo

RUN mkdir -p /home/yii
RUN mkdir -p /var/www/html
RUN mkdir -p /var/www/.composer
RUN chown -R yii:yii /home/yii
RUN chown -R yii:yii /var/www/html
RUN chown -R yii:yii /var/www/.composer
RUN chown -R yii:yii /usr/local/etc

USER yii