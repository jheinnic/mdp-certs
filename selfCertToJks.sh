#!/bin/sh

openssl pkcs12 -export -in selfsigned.pem -inkey selfsigned.key -out tmp.p12 -name `hostname` -passin pass:abc123 -passout pass:abc123

keytool -importkeystore -srckeystore tmp.p12 -srcstoretype PKCS12 -srcstorepass abc123 -alias `hostname` -deststoretype JKS -deststorepass abc123 -destkeypass abc123 -destkeystore tmp-keystore.jks
