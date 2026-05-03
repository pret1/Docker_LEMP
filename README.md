In this project we create a simple application about articles and authors. That app include PHP, Composer, Xdebug, Nginx, MySQL 

change xdebug.client_host=192.168.1.101 in xdebug.ini

"ip addr show docker0 | grep inet | awk '{ print $2 }' | cut -d/ -f1"

create "laravel, bundles, my-db" folders

create .env

copy .env.dist to .env

create project "composer create-project laravel/laravel example-app"


i use windows
PS C:\Projects\personal\laravel_exp\laravel_exp> docker compose logs php
php  | exec /docker-entrypoint.sh: no such file or directory

Option A: Using VS Code
Open ./docker/php/docker-entrypoint.sh in VS Code
Look at the bottom-right status bar — if you see CRLF, click it
Select LF
Save the file

/home/laravel/.config/composer/vendor/bin/laravel new new_app

➜ cd new_app
➜ npm install --ignore-scripts && npm run build
➜ composer run dev