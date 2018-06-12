#!/bin/bash

BOSH_CLIENT=${BOSH_CLIENT} BOSH_CLIENT_SECRET=${BOSH_CLIENT_SECRET} BOSH_CA_CERT=/var/tempest/workspaces/default/root_ca_certificate BOSH_ENVIRONMENT=${BOSH_ADDRESS} bosh2 -d cf-651c51d5ecec8e83e97b -n cck --resolution delete_disk_reference --resolution delete_vm_reference
echo "REMOVED THE CLOUD STALE IDS"
