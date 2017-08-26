#!/bin/sh

# keytool -importkeystore -srckeystore selfsigned.jks -srcstorepass abc123 -srckeypass abc123 -destkeystore tmp-keystore.p12 -deststoretype PKCS12 -srcalias `hostname` -deststorepass abc123 -destkeypass abc123

keytool -importkeystore -srckeystore selfsigned.jks -srcstoretype JKS -destkeystore tmp-keystore.p12 -deststoretype PKCS12 -srcalias `hostname` -deststorepass abc123 -destkeypass abc123

# Now use openssl to split the PKCS12 file created above into first, the certificate file, and then the private key file. While the CA-issued certificate can be used as is, the command has been provided here for completeness.

openssl pkcs12 -in tmp-keystore.p12 -passin pass:abc123  -nokeys -out selfsigned.pem
openssl pkcs12 -in tmp-keystore.p12 -passin pass:abc123 -nocerts -out selfsigned.key 
openssl pkcs12 -in tmp-keystore.p12 -passin pass:abc123 -nocerts -out selfsigned_pw.key -passout pass:abc123
