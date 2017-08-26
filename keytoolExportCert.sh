#!/bin/sh

# First block strips passwords.  Commented out block retains them.

keytool -importkeystore -srckeystore `hostname`.jks -srcstorepass abc123 -srckeypass abc123 -destkeystore `hostname`-keystore.p12 -deststoretype PKCS12 -srcalias `hostname` -deststorepass abc123 -destkeypass abc123
echo "step one"
openssl pkcs12 -in `hostname`-keystore.p12 -nokeys -out `hostname`.pem -passin pass:abc123
echo "step two"
openssl pkcs12 -in `hostname`-keystore.p12 -nocerts -out `hostname`.pass.key -passin pass:abc123 -passout pass:abc123
echo "step three"
openssl rsa -passin pass:abc123 -in `hostname`.pass.key -out `hostname`.key



# Now use openssl to split the PKCS12 file created above into first, the certificate file, and then the private key file. While the CA-issued certificate can be used as is, the command has been provided here for completeness.
#
# keytool -importkeystore -srckeystore `hostname`.jks -srcstorepass abc123 -srckeypass abc123 -destkeystore `hostname`-keystore.p12 -deststoretype PKCS12 -srcalias `hostname` -deststorepass abc123 -destkeypass abc123
# openssl pkcs12 -in `hostname`-keystore.p12 -passin pass:abc123  -nokeys -out selfsigned.pem
# openssl pkcs12 -in `hostname`-keystore.p12 -passin pass:abc123 -nocerts -out selfsigned.key 
# openssl pkcs12 -in `hostname`-keystore.p12 -passin pass:abc123 -nocerts -out selfsigned_pw.key -passout pass:abc123
