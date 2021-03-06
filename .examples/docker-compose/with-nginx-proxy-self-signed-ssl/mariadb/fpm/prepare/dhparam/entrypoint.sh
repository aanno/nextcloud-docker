#!/bin/sh -x
set -eu

DHPARAM="/certs/dhparam.pem"

mkdir /certs || true
if [ ! -f "$DHPARAM" ]; then
  rm -f "$DHPARAM"
  openssl dhparam --out "$DHPARAM" 2048
fi
