# Use PHP 8.4
FROM php:8.4-cli

WORKDIR /var/www

# Install system dependencies + Node
RUN apt-get update && apt-get install -y \
    git unzip curl \
    libpng-dev libjpeg-dev libfreetype6-dev \
    libzip-dev libonig-dev libxml2-dev \
    libpq-dev libicu-dev zip \
    nodejs npm \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install \
        pdo pdo_mysql pdo_pgsql \
        mbstring bcmath exif pcntl fileinfo intl \
        gd zip opcache

# Install Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Copy project
COPY . .

# Install PHP dependencies
RUN composer install --no-dev --optimize-autoloader --no-interaction --no-scripts

# Install Node dependencies and build assets
RUN npm install && npm run build

EXPOSE 10000

CMD php artisan migrate --force || true && \
    php artisan config:cache && \
    php -S 0.0.0.0:${PORT:-10000} -t public
