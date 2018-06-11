#!/bin/bash -eu

### applying changes to opsman director
om -k --target "${OPSMAN_URL}" --username "${OPSMAN_USERNAME}" --password "${OPSMAN_PASSWORD}" curl -p /api/v0/installations -x POST -d '{"deploy_products": "none","ignore_warnings": true}'
 


echo "BOSH DIRECTOR DEPLOYED  SUCCESSFUL!"

