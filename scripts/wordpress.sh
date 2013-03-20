#!/bin/bash
MYSQL_ROOT_USERNAME='root'
MYSQL_ROOT_PASSWORD='password'
# check input
if [ $# -ne 1 ]; then
    echo "Usage: sh wordpress.sh sitename"
fi

sitename=$1
sanitized_sitename=${sitename//./_}

# download wordpress
wget http://wordpress.org/latest.tar.gz -O wordpress.tmp.tar.gz
tar -xz -C /tmp -f wordpress.tmp.tar.gz
rm -f wordpress.tmp.tar.gz
mv /tmp/wordpress $sitename

# harden wordpress
mkdir $sitename/wp-content/uploads
find $sitename -type d -exec chmod 750 {} \;
find $sitename -type f -exec chmod 640 {} \;
chmod 770 $sitename/wp-content/uploads

# config mysql
mysql -f -u$MYSQL_ROOT_USERNAME -p$MYSQL_ROOT_PASSWORD -e <<EOSQL "CREATE DATABASE IF NOT EXISTS $sanitized_sitename;
GRANT ALL ON $sanitized_sitename.* TO '$sanitized_sitename'@'localhost' IDENTIFIED BY '$sanitized_sitename';
FLUSH PRIVILEGES;"
EOSQL

# edit wp-config.php
mv $sitename/wp-config-sample.php $sitename/wp-config.php
sed -i "s/^define('DB_NAME'.*);/define('DB_NAME', '$sitename');/g"  $sitename/wp-config.php
sed -i "s/^define('DB_USER'.*);/define('DB_USER', '$sitename');/g"  $sitename/wp-config.php
sed -i "s/^define('DB_PASSWORD'.*);/define('DB_PASSWORD', '$sitename');/g"  $sitename/wp-config.php
salts=`curl https://api.wordpress.org/secret-key/1.1/salt`
printf '%s\n' "g/put your unique phrase here/d" a "$salts" . w | ed -s $sitename/wp-config.php
sed -i "s/\r//g" $sitename/wp-config.php
