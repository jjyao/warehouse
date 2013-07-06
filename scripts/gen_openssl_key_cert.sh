#!/bin/bash
openssl genrsa -aes128 -passout pass:passwd -out server.key 2048
openssl req -new -key server.key -out server.csr -batch -passin pass:passwd
cp server.key server.key.org
openssl rsa -in server.key.org -out server.key -passin pass:passwd
openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt
rm -f server.key.org server.csr
