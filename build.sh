#!/bin/bash

# Specify the PHP version
PHP_VERSION="7.4" # or any other version you need

# Update package list and install PHP
apt-get update
apt-get install -y php$PHP_VERSION php$PHP_VERSION-cli php$PHP_VERSION-fpm php$PHP_VERSION-mbstring php$PHP_VERSION-xml

# Install Composer
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

# Install project dependencies
composer install --no-dev

echo "Build completed successfully."