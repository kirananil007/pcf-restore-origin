#!/bin/bash -eu

. "$(dirname $0)"/../../scripts/export-director-metadata

## extract the s3 bucket contents
cd ../../../om-install
ls -al
#om_cmd import-installation installation.zip --decryption-passphrase ${PASSPHRASE}

echo "Import Complete!"
