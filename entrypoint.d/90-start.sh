#!/bin/bash

/opt/remi/php70/root/usr/sbin/php-fpm -D&

tail -f /var/log/nginx/*.log