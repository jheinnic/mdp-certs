#!/bin/sh

set RANDFILE=rand

openssl genrsa -out caroot.key -aes-256-cbc -passout pass:abc123 2048
