#!/bin/sh

keytool -import -alias TestCA -file caroot.cer -keystore ../`hostname`.jks -storepass abc123

keytool -import -alias `hostname`Signed -file ../`hostname`-CASigned.cer -keystore ../`hostname`.jks -storepass abc123
