#!/bin/bash
echo "=> Generate root CA"
openssl req -x509 -sha256 -newkey rsa:3072 -keyout ca-key.pem -out ca.pem -days 3650 -nodes -subj '/C=CH/ST=Geneva/L=Geneva/O=TMS/OU=IT/CN=docker'

echo "=> Generate server certs"
openssl req -newkey rsa:3072 -days 3650 -nodes -keyout ./mysql/server-key.pem -out server-req.pem -subj "/C=CH/ST=Geneva/L=Geneva/O=TMS/OU=IT/CN=db"
openssl x509 -req -sha256 -extensions v3_ca -in server-req.pem -days 3650 -CA ca.pem -CAkey ca-key.pem -set_serial 01 -out ./mysql/server-cert.pem

echo "=> Generate client certs"
openssl req -newkey rsa:3072 -days 3650 -nodes -keyout ./wordpress/client-key.pem -out client-req.pem -subj "/C=CH/ST=Geneva/L=Geneva/O=TMS/OU=IT/CN=wordpress"
openssl x509 -req -sha256 -extensions v3_ca -in client-req.pem -days 3650 -CA ca.pem -CAkey ca-key.pem -set_serial 01 -out ./wordpress/client-cert.pem

echo "=> Verify certificates validity"
openssl verify -CAfile ca.pem mysql/server-cert.pem wordpress/client-cert.pem

echo "=> Cleanup requests"
cp ca.pem mysql
cp ca.pem wordpress
rm ca.pem
rm ca-key.pem
rm client-req.pem
rm server-req.pem
