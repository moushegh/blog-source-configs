#!/bin/bash

echo "setting up RDS"

LOC="/var/www"

sed -i "s@getenv('RDS_DB_NAME')@'$RDS_DB_NAME'@" $LOC/wp-config.php
sed -i "s@getenv('RDS_USERNAME')@'$RDS_USERNAME'@" $LOC/wp-config.php
sed -i "s@getenv('RDS_PASSWORD')@'$RDS_PASSWORD'@" $LOC/wp-config.php
sed -i "s@getenv('RDS_HOSTNAME')@'$RDS_HOSTNAME'@" $LOC/wp-config.php
sed -i "s@getenv('wpprefix')@'$wpprefix'@" $LOC/wp-config.php

sed -i "s@getenv('AUTH_KEY')@'$AUTH_KEY'@" $LOC/wp-config.php
sed -i "s@getenv('SECURE_AUTH_KEY')@'$SECURE_AUTH_KEY'@" $LOC/wp-config.php
sed -i "s@getenv('LOGGED_IN_KEY')@'$LOGGED_IN_KEY'@" $LOC/wp-config.php
sed -i "s@getenv('NONCE_KEY')@'$NONCE_KEY'@" $LOC/wp-config.php
sed -i "s@getenv('AUTH_SALT')@'$AUTH_SALT'@" $LOC/wp-config.php
sed -i "s@getenv('SECURE_AUTH_SALT')@'$SECURE_AUTH_SALT'@" $LOC/wp-config.php
sed -i "s@getenv('LOGGED_IN_SALT')@'$LOGGED_IN_SALT'@" $LOC/wp-config.php
sed -i "s@getenv('NONCE_SALT)@'$NONCE_SALT'@" $LOC/wp-config.php


echo "Starting supervisor"
/etc/init.d/supervisor start
