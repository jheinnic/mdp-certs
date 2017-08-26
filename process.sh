#!/bin/sh

rm MachinaDePlaya.local.* *.jks *.key *.csr *.cer *.p12

./keytoolMakeKey.sh
./keytoolGenCsr.sh
cd CA
./signSelfCert.sh
./blankTrustCACert.sh
cd ..
./jksToP12.sh
