FROM php:7.3-fpm

WORKDIR /application

RUN apt-get update
RUN apt-get install -y \
        libwebp-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libxpm-dev \
        libzip-dev \
        libfreetype6-dev \
        libzip-dev \
        zip \
        libxml2-dev

RUN docker-php-ext-configure zip --with-libzip
RUN docker-php-ext-install zip
RUN docker-php-ext-configure gd --with-freetype-dir --with-jpeg-dir
RUN docker-php-ext-install mysqli gd soap
RUN pecl install xdebug-3.1.0
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin/ --filename=composer
RUN apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

COPY ./php-ini-overrides.ini /usr/local/etc/php/conf.d/php-ini-overrides.ini

RUN usermod -u 1000 www-data