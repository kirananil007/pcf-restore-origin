#!/bin/bash

##apply changes to ERT
echo "Applying changes to ERT"
#om_cmd apply-changes --ignore-warnings
om -k --target "${OPSMAN_URL}" --username "${OPSMAN_USERNAME}" --password "${OPSMAN_PASSWORD}" apply-changes --ignore-warnings
