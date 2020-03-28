#!/bin/sh

set RANDFILE=rand

openssl req -newkey rsa:2048 -keyout cakey.pem -out careq.pem -passout pass:abc123
openssl x509 -signkey cakey.pem -req -days 3650 -in careq.pem -out caroot.cer -extensions v3_ca -passin pass:abc123

keytool -printcert -v -file caroot.cer
# keytool -list -protected -keystore cacerts

openssl x509 -CA caroot.cer -CAkey cakey.pem -CAserial serial.txt -req -in ../`hostname`.csr -out ../`hostaname`-CASigned.cer -days 3650

# -config C:\OpenSSL-Win64\bin\openssl.cfg