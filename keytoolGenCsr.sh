#!/bin/sh

keytool -certreq -keystore `hostname`.jks -alias `hostname` -storepass abc123  -keypass abc123 -file `hostname`.csr


# keytool -importcert -keystore node1.keystore -alias `hostname` -storepass abc123 -keypass abc123 -trustcacerts -file `hostname`.crt
