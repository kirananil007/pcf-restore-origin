#!/bin/bash
. "$(dirname $0)"/../../scripts/export-director-metadata

## extract the s3 bucket contents
cd ../../../director-backup-bucket
cp -r director-*.tar ../binary/
cd ../binary/
tar -xvf director-*.tar

## the restoration of bosh director
./bbr director --private-key-path <(echo "${BBR_PRIVATE_KEY}") --username bbr --host "${BOSH_ADDRESS}" restore --artifact-path 192.168.*

sleep 120

