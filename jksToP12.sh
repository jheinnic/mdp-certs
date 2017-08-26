#!/bin/sh

keytool -importkeystore -srckeystore blank.jks -srcstorepass abc123 -destkeystore bluemix-CA.p12 -deststoretype PKCS12 -srcalias TestCA -deststorepass abc123 
keytool -importkeystore -srckeystore blank.jks -srcstorepass abc123 -destkeystore bluemix-app.p12 -deststoretype PKCS12 -srcalias `hostname` -deststorepass abc123 -destalias `hostname`-signed
keytool -importkeystore -srckeystore `hostname`.jks -srcstorepass abc123 -srckeypass abc123 -srcalias `hostname` -destkeystore bluemix-app.p12 -deststoretype PKCS12 -deststorepass abc123 -destkeypass abc123

# Now use openssl to split the PKCS12 file created above into first, the certificate file, and then the private key file. While the CA-issued certificate can be used as is, the command has been provided here for completeness.

# openssl pkcs12 -in tmp-keystore.p12 -passin pass:password  -nokeys -out selfsigned.pem
# openssl pkcs12 -in tmp-keystore.p12 -passin pass:password -nocerts -out selfsigned.key 
# openssl pkcs12 -in tmp-keystore.p12 -passin pass:password -nocerts -out selfsigned_pw.key -passout pass:password
