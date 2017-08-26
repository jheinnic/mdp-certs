#!/bin/sh

openssl x509 -CA caroot.cer -CAkey cakey.pem -CAserial serial.txt -req -in ../`hostname`.csr -out ../`hostname`-CASigned.cer -days 3650 -passin pass:abc123
