#!/bin/sh 

keytool -genkeypair -keystore `hostname`.jks -alias `hostname` -dname "CN=portfolio.dev.jchein.name, OU=., O=John Heinnickel, L=Santa Clara, ST=California, C=US" -keyalg RSA -keysize 2048 -keypass abc123 -storepass abc123
