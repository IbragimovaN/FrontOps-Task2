#!/bin/bash

# Останавливаем все контейнеры
docker-compose down

# Запускаем только nginx на порту 80 для верификации
docker-compose up nginx -d

# Принудительно перевыпускаем сертификат (так как текущий истек)
docker-compose run --rm certbot certonly --webroot --webroot-path /var/www/certbot -d ibragimova.site --email your-email@example.com --agree-tos --force-renewal

# Запускаем все сервисы
docker-compose up -d

echo "SSL сертификат обновлен и все сервисы запущены"