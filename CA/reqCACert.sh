#!/bin/sh

set RANDFILE=rand

openssl req -out caroot.csr -key caroot.key -new -sha256 -passin pass:abc123
