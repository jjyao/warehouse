#!/bin/bash
MYSQL_ROOT_USERNAME='root'
MYSQL_ROOT_PASSWORD='password'
# check input
if [ $# -ne 1 ]; then
    echo "Usage: sh wordpress.sh sitename"
fi
# download wordpress
wget http://wordpress.org/latest.tar.gz -O wordpress.tmp.tar.gz
tar -xz -C /tmp -f wordpress.tmp.tar.gz
rm -f wordpress.tmp.tar.gz
mv /tmp/wordpress $1

# harden wordpress
mkdir $1/wp-content/uploads
find $1 -type d -exec chmod 750 {} \;
find $1 -type f -exec chmod 640 {} \;
chmod 770 $1/wp-content/uploads

# config mysql
mysql -f -u$MYSQL_ROOT_USERNAME -p$MYSQL_ROOT_PASSWORD -e <<EOSQL "CREATE DATABASE IF NOT EXISTS $1;
GRANT ALL ON $1.* TO '$1'@'localhost' IDENTIFIED BY '$1';
FLUSH PRIVILEGES;"
EOSQL

# edit wp-config.php
mv $1/wp-config-sample.php $1/wp-config.php
sed -i "s/^define('DB_NAME'.*);/define('DB_NAME', '$1');/g"  $1/wp-config.php
sed -i "s/^define('DB_USER'.*);/define('DB_USER', '$1');/g"  $1/wp-config.php
sed -i "s/^define('DB_PASSWORD'.*);/define('DB_PASSWORD', '$1');/g"  $1/wp-config.php
salts=`curl https://api.wordpress.org/secret-key/1.1/salt`
printf '%s\n' "g/put your unique phrase here/d" a "$salts" . w | ed -s $1/wp-config.php
sed -i "s/\r//g" $1/wp-config.php
