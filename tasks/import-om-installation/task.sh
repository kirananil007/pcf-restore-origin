#!/bin/bash -eu

#. "$(dirname $0)"/../../scripts/export-director-metadata

## extract the s3 bucket contents
cd ../../../om-install
ls -al

##import the installation file to opsman
#om -k --target "${OPSMAN_URL}" --username "${OPSMAN_USERNAME}" --password "${OPSMAN_PASSWORD}" import-installation --installation installation.zip --decryption-passphrase ${PASSPHRASE}

echo "Import Complete!"
