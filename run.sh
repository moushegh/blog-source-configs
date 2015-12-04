#!/bin/bash

echo "setting up RDS"

LOC="/var/www"

sed -i "s@getenv('RDS_DB_NAME')@'$RDS_DB_NAME'@" $LOC/wp-config.php
sed -i "s@getenv('RDS_USERNAME')@'$RDS_USERNAME'@" $LOC/wp-config.php
sed -i "s@getenv('RDS_PASSWORD')@'$RDS_PASSWORD'@" $LOC/wp-config.php
sed -i "s@getenv('RDS_HOSTNAME')@'$RDS_HOSTNAME'@" $LOC/wp-config.php
sed -i "s@getenv('wpprefix')@'$wpprefix'@" $LOC/wp-config.php



echo "Starting supervisor"
/etc/init.d/supervisor start
