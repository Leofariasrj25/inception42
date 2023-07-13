#!/bin/sh

KEY_NAME=key.pem
CERT_NAME=cert.pem
SSL_CONF=openssl.cnf
DAYS=365

openssl req -x509 -newkey rsa:2048 -nodes -keyout ${KEY_NAME} -out ${CERT_NAME} -config ${SSL_CONF} -days ${DAYS}
mkdir -v /cert/
mv ./${KEY_NAME} ./cert/${KEY_NAME}
mv ./${CERT_NAME} ./cert/${CERT_NAME}
