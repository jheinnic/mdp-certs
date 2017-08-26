#!/bin/sh 

# keytool -genkeypair -keyalg RSA -alias `hostname` -keystore selfsigned.jks -validity 3650 -keysize 2048 -keypass abc123 -storepass abc123

# keytool -genkeypair -keystore `hostname`.jks -alias `hostname` -dname "CN=John Heinnickel, OU=., O=., L=Santa Clara, ST=California, C=US" -keyalg RSA -keysize 2048 -validity 3650 -keypass abc123 -storepass abc123

keytool -genkeypair -keystore `hostname`.jks -alias `hostname` -dname "CN=John Heinnickel, OU=., O=., L=Santa Clara, ST=California, C=US" -keyalg RSA -keysize 2048 -keypass abc123 -storepass abc123
