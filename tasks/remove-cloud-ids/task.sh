#!/bin/bash

echo $OPSMAN_KEY  | sed -e 's/\(KEY-----\)\s/\1\n/g; s/\s\(-----END\)/\n\1/g' | sed -e '2s/\s\+/\n/g' > ~/ssh_access.pem
chmod 600 ~/ssh_access.pem
ssh-agent > ~/agent
eval $(ssh-agent -s)
ssh-add ~/ssh_access.pem


#login to opsman
ssh -i ~/ssh_access.pem -o "StrictHostKeyChecking no"  "${OPSMAN_USER_EC2}"@"${OPSMAN_IP}" -t "BOSH_CLIENT=${BOSH_CLIENT} BOSH_CLIENT_SECRET=${BOSH_CLIENT_SECRET} BOSH_CA_CERT=/var/tempest/workspaces/default/root_ca_certificate BOSH_ENVIRONMENT=${BOSH_ADDRESS} bosh2 -d cf-651c51d5ecec8e83e97b -n cck --resolution delete_disk_reference --resolution delete_vm_reference"
echo "REMOVED THE CLOUD STALE IDS"
