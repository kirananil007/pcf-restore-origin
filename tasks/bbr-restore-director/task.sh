#!/bin/bash
. "$(dirname $0)"/../../scripts/export-director-metadata

echo $OPSMAN_KEY  | sed -e 's/\(KEY-----\)\s/\1\n/g; s/\s\(-----END\)/\n\1/g' | sed -e '2s/\s\+/\n/g' > ~/ssh_access.pem
chmod 600 ~/ssh_access.pem
ssh-agent > ~/agent
eval $(ssh-agent -s)
ssh-add ~/ssh_access.pem

echo we can run any bash command here!!!!
expect - <<EOF
spawn ssh -i ~/ssh_access.pem ${OPSMAN_USER_EC2}@${OPSMAN_IP}
expect {
"*you sure you want to continue*" {send "yes"}
}
##expect "*you sure you want to continue*"
##send "yes\r"
send "sudo cat /var/tempest/workspaces/default/deployments/bosh-state.json\n"
expect "*$hostnam*>"
send "sudo su -\n"
expect "*$hostnam*>"
send "cd /var/tempest/workspaces/default/\n"
expect "*$hostnam*>"
send "bosh2 -e sst-director login\n"
expect "Email():"
send "$BOSH_USER\r"
expect "Password ():"
send "$BOSH_PASSWORD\r"
expect eof
send "bosh2 -e sst-director vms\n"
expect "*$hostnam*>"
send "echo BOSH director restoration is successful!!!\n"
expect "*$hostnam*>"
EOF
