/usr/bin/expect <<EOF

#. "$(dirname $0)"/../../scripts/export-director-metadata\n"
#expect "*$hostnam*>"

## removing the bosh_state file from opsman
spawn ssh -i "${OPSMAN_KEY}" -o "StrictHostKeyChecking no" "${OPSMAN_USER_EC2}"@"${OPSMAN_IP}"
expect "*you sure you want to continue*"
send "yes\r"
expect "*$hostnam*>"
send "sudo cat /var/tempest/workspaces/default/deployments/bosh-state.json\n"
expect "*$hostnam*>"
send "echo $PWD\n"
expect "*$hostnam*>"
send "bosh2 -e sst-director login\n"
expect "Email():"
send "$BOSH_USER\r"
expect "Password ():"
send "$BOSH_PASSWORD\r"
expect eof
send "bosh2 -e sst-director vms\n"
expect "*$hostnam*>"
#sudo rm -rf /var/tempest/workspaces/default/deployments/bosh-state.json


## applying changes to opsman director
#om_cmd apply-changes --ignore-warnings



send "echo "BOSH director restoration is successful!\n"
expect "*$hostnam*>"
EOF
