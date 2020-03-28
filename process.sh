#!/bin/sh

rm `hostname`.csr `hostname`.cer `hostname`.jks
rm *.jks *.key *.csr *.cer *.p12

./keytoolMakeKey.sh
./keytoolGenCsr.sh
cd CA
./selfSignCertReq.sh
./blankTrustCACert.sh
cd ..
./jksToP12.sh
