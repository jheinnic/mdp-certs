#!/bin/sh

keytool -importcert -alias TestCA -file caroot.cer -keystore ../blank.jks -storepass abc123 -keypass abc123

keytool -importcert -alias `hostname` -file ../`hostname`-CASigned.cer -keystore ../blank.jks -storepass abc123 -keypass abc123
