#!/bin/sh

set RANDFILE=rand

# More flexibility when generating key and CSR separately
# openssl req -newkey rsa:2048 -keyout caroot.key -out caroot.csr -passout pass:abc123

openssl genrsa -out caroot.key -aes-256-cbc -passout pass:abc123 4096
openssl req -out caroot.csr -key caroot.key -new -sha512 -passin pass:abc123
openssl x509 -signkey caroot.key -req -days 3650 -in caroot.csr -out caroot.cer -extensions v3_ca -passin pass:abc123

keytool -printcert -v -file caroot.cer
# keytool -list -protected -keystore cacerts

# Do this only after creating a CSR to approve
# openssl x509 -CA caroot.cer -CAkey caroot.key -CAserial serial.txt -req -in ../`hostname`.csr -out ../`hostname`-CASigned.cer -days 3650 -passin pass:abc123

# -config C:\OpenSSL-Win64\bin\openssl.cfg
