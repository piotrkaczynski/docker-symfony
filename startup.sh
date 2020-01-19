#!/usr/bin/env bash
docker-compose up -d
docker-compose exec php composer install
docker-compose exec php bash -c "/usr/bin/wait-for-db.sh db:3306 && php bin/console doctrine:migration:migrate --no-interaction"