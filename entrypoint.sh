#!/bin/sh

set -e

rm -f /usr/src/app/tmp/pids/server.pid

# echo | find /tmp/ -name .s.PGSQL.5432
# exec "$@"

bundle check || bundle install --jobs 4

yarn cache clean 
yarn install --check-files

rails webpacker:install

exec "$@"

# rails db:create
# rails db:migrate
# rails db:seed
# 
# rails server
