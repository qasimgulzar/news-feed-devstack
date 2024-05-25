FROM php:8.0.0rc1-fpm

# Install system dependencies
RUN apt-get update && apt-get install -y git

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
RUN composer global require "laravel/installer=~1.1"
RUN apt-get install zip unzip
RUN apt-get update && apt-get install -y libzip-dev && docker-php-ext-install zip
RUN export PATH=~/.composer/vendor/bin:$PATH

RUN mkdir -p /app/backend
RUN mkdir -p /app/frontend

ARG CACHEBUST=2

RUN git clone https://github.com/qasimgulzar/news-feed-backend-laravel.git /app/backend
RUN git clone https://github.com/qasimgulzar/news-feed-frontend-react.git /app/frontend


RUN cd /app/backend && COMPOSER_ALLOW_SUPERUSER=1 composer install
RUN cd /app/backend && cp /app/backend/.env.example /app/backend/.env

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
RUN . ~/.bashrc && nvm install v20.11.1
RUN . ~/.bashrc && nvm use v20.11.1
RUN . ~/.bashrc && nvm alias default v20.11.1
RUN . ~/.bashrc && npm install -g pnpm

RUN . ~/.bashrc && nvm use v20.11.1 && cd /app/frontend && pnpm install
COPY ./frontend-entrypoint.sh /app/frontend/frontend-entrypoint.sh

