#!/bin/sh
cd /var/www/html
/usr/sbin/httpd -DFOREGROUND & 
cd /my_project_name/
php bin/console server:run 0.0.0.0:8000 &