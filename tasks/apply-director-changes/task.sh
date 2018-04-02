#!/bin/bash -eu

. "$(dirname $0)"/../../scripts/export-director-metadata


## removing the bosh_state file from opsman
ssh -i "${OPSMAN_KEY}" -o "StrictHostKeyChecking no" "${OPSMAN_USER_EC2}"@"${OPSMAN_IP}" <<EOF
sudo cat /var/tempest/workspaces/default/deployments/bosh-state.json
EOF
echo $PWD
#sudo rm -rf /var/tempest/workspaces/default/deployments/bosh-state.json


## applying changes to opsman director
#om_cmd apply-changes --ignore-warnings



echo "BOSH director restoration is successful!"
