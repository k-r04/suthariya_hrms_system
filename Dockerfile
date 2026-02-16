# Dockerfile for PHP Laravel Application

# Use the official PHP image as a base
FROM php:8.0-fpm

# Set the working directory
WORKDIR /var/www/html

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libzip-dev \
    unzip \
    git \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd \
    && docker-php-ext-install zip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*;

# Install Composer globally
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Copy existing application directory contents
COPY . .

# Install PHP dependencies
RUN composer install --no-interaction --prefer-dist

# Expose the port that the app runs on
EXPOSE 9000

# Start the PHP FastCGI Process Manager
CMD ["php-fpm"]