FROM php:8.4-fpm

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
    libicu-dev \
    libfreetype6-dev

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

ADD docker-entrypoint.sh /docker-entrypoint.sh

RUN ["chmod", "+x", "/docker-entrypoint.sh"]
ENTRYPOINT ["/docker-entrypoint.sh"]

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
RUN curl -sL https://deb.nodesource.com/setup_20.x | bash -
RUN apt-get install -y nodejs

ADD conf.d/xdebug.ini $PHP_INI_DIR/conf.d/zz-xdebug.ini
ADD conf.d/error_reporting.ini $PHP_INI_DIR/conf.d/error_xdebug.ini

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN curl -sS https://get.symfony.com/cli/installer | bash
RUN mv /root/.symfony5/bin/symfony /usr/local/bin/symfony

ADD etc/php-fpm.conf /usr/local/etc/

RUN groupadd -g 1000 laravel
RUN useradd --no-log-init -d /home/laravel -s /bin/bash -u 1000 -g 1000 laravel
RUN echo "laravel:laravel" | chpasswd && adduser laravel sudo

COPY conf.d/* $PHP_INI_DIR/conf.d/

RUN mkdir -p /home/laravel
RUN mkdir -p /var/www/html
RUN mkdir -p /var/www/.composer
RUN chown -R laravel:laravel /home/laravel
RUN chown -R laravel:laravel /var/www/html
RUN chown -R laravel:laravel /var/www/.composer
RUN chown -R laravel:laravel /usr/local/etc

USER laravel

CMD ["php-fpm", "-F"]