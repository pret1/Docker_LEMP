#!/bin/bash
set -e
# Configure PHP-FPM
[ ! -z "${developer}" ] && sed -i "s/!developer!/${developer}/" /usr/local/etc/php-fpm.conf
exec "$@"