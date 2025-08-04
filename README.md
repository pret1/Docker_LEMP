In this project we create a simple application about articles and authors. That app include PHP, Composer, Xdebug, Nginx, MySQL 

change xdebug.client_host=192.168.1.101 in xdebug.ini

"ip addr show docker0 | grep inet | awk '{ print $2 }' | cut -d/ -f1"

create "laravel, bundles, my-db" folders

create .env

copy .env.dist to .env

docker compose exec php bash

create project "composer create-project laravel/laravel example-app"

in laravel folder if you change part with
```
DB_CONNECTION=mysql
 DB_HOST=mysql
 DB_PORT=3306
 DB_DATABASE=laravel
 DB_USERNAME=laravel
 DB_PASSWORD=laravel
```
```
DB_CONNECTION=pgsql
DB_HOST=pgsql
DB_PORT=5432
DB_DATABASE=postgres
DB_USERNAME=sun
DB_PASSWORD=postgres
```
don't forget run "docker compose run --rm php php artisan migrate"

enter in php container ->  npm install
                        -> npm install vue@latest vue-loader@latest
                        -> npm i @vitejs/plugin-vue

update vite.config.js to 
```
import { defineConfig } from 'vite';
import laravel from 'laravel-vite-plugin';
import vue from '@vitejs/plugin-vue';

export default defineConfig({
    plugins: [
        laravel({
            input: 'resources/js/app.js',
            refresh: true,
        }),
        vue({
            template: {
                transformAssetUrls: {
                    base: null,
                    includeAbsolute: false,
                },
            },
        }),
    ],
    server: {
        host: '0.0.0.0',  // Listen on all interfaces within the container
        port: 5173,       // Port for Vite dev server
        hmr: {
            host: 'localhost',
        },
    },
    build: {
        outDir: 'public/build',
        manifest: true,
    },
});

```

In resources/js/app.js 

```
import './bootstrap';
import '../css/app.css';

import {createApp} from 'vue'

import App from './App.vue'

createApp(App).mount("#app")

```

In resources/js create App.vue 
```
<template>
    <h1>Welcome Vue</h1>
</template>

```

In resources/views edit welcome.blade.php
clean all and don't forgot add @vite('resources/js/app.js'), "div id="app"></div>"
```
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    @vite('resources/js/app.js')
</head>
<body>
<div id="app">
</div>
</body>
</html>

```

Update .env in laravel folder APP_URL=http://localhost:8080

npm run dev

if you start old project 
you can get error "No application encryption key has been specified."
you can get .env from prod environment OR 
https://stackoverflow.com/questions/44839648/no-application-encryption-key-has-been-specified 
php artisan key:generate 
php artisan config:cache

can help for laravel12
https://dev.to/robin-ivi/laravel-12-and-vue-3-ultimate-starter-guide-3bmd
npm install vue@latest vue-router@latest @vitejs/plugin-vue

"~/.composer/vendor/bin/laravel new my-app" instead "laravel new my-app" if can't find laravel in container 
