FROM php:8.2-cli

WORKDIR /var/www

RUN apt-get update && apt-get install -y \
    git \
    unzip \
    curl \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libzip-dev \
    libonig-dev \
    libxml2-dev \
    libpq-dev \
    libicu-dev \
    zip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install \
        pdo \
        pdo_mysql \
        pdo_pgsql \
        mbstring \
        bcmath \
        exif \
        pcntl \
        fileinfo \
        intl \
        gd \
        zip \
        opcache

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

COPY . .

# Prevent artisan scripts during build
RUN composer install --no-dev --optimize-autoloader --no-interaction --no-scripts

EXPOSE 8000

CMD php artisan migrate --force && php artisan config:cache && php -S 0.0.0.0:${PORT:-8000} -t public
