#!/bin/sh

set RANDFILE=rand

openssl genrsa -out caroot.key -pasout pass:abc123 2048
