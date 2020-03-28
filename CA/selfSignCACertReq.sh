#!/bin/sh

set RANDFILE=rand

openssl x509 -signkey caroot.key -req -days 3650 -in caroot.csr -out caroot.cer -extensions v3_ca -passin pass:abc123
keytool -printcert -v -file caroot.cer
