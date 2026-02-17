# Use PHP 8.2 (Required for Filament v4)
FROM php:8.2-cli

# Set working directory
WORKDIR /var/www

# Install system dependencies
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
    zip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install \
        pdo \
        pdo_pgsql \
        bcmath \
        gd \
        zip \
        opcache \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Copy application files
COPY . .

# Install PHP dependencies (Production)
RUN composer install \
    --no-dev \
    --optimize-autoloader \
    --no-interaction

# Set proper permissions
RUN chmod -R 775 storage bootstrap/cache

# Expose Render/Railway dynamic port
EXPOSE 8000

# Optimize Laravel + Filament (Production best practice)
RUN php artisan config:cache && \
    php artisan route:cache && \
    php artisan view:cache

# Start Laravel built-in server
CMD php artisan migrate --force && php -S 0.0.0.0:${PORT:-8000} -t public
