#!/bin/sh

mkdir -p ./certs
cd certs

openssl genrsa -des3 -passout pass:x -out server.pass.key 2048
openssl rsa -passin pass:x -in server.pass.key -out server.key
cat server.pass.key
# rm server.pass.key 
openssl req -new -key server.key -out server.csr

# End result: server.key, server.csr, and server.cer

cd ..
