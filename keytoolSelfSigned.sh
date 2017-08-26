#!/bin/sh 

# keytool -genkeypair -keystore `hostname`.jks -alias `hostname` -dname "CN=John Heinnickel, OU=., O=., L=Santa Clara, ST=California, C=US" -keyalg RSA -keysize 2048 -validity 3650 -keypass abc123 -storepass abc123
keytool -genkeypair -keystore `hostname`.jks -alias `hostname` -dname "CN=John Heinnickel, OU=., O=., L=Santa Clara, ST=California, C=US" -keyalg RSA -keypass abc123 -storepass abc123
