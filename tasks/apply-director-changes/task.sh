#!/bin/bash -eu

. "$(dirname $0)"/../../scripts/export-director-metadata


### setting opsman keys
echo $OPSMAN_KEY  | sed -e 's/\(KEY-----\)\s/\1\n/g; s/\s\(-----END\)/\n\1/g' | sed -e '2s/\s\+/\n/g' > ~/ssh_access.pem
chmod 600 ~/ssh_access.pem
ssh-agent > ~/agent
eval $(ssh-agent -s)
ssh-add ~/ssh_access.pem

###login to opsman and removing bosh state file
ssh -i ~/ssh_access.pem -o "StrictHostKeyChecking no"  "${OPSMAN_USER_EC2}"@"${OPSMAN_IP}" <<EOF
#sudo rm -rf /var/tempest/workspaces/default/deployments/bosh-state.json
sudo ls -al /var/tempest/workspaces/default/deployments/bosh-state.json
EOF

## applying changes to opsman director
om_cmd
#om_cmd apply-changes --ignore-warnings



echo "BOSH director restoration is successful!"
