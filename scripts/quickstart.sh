#!/bin/bash
set -e
CURRENT_DIR=$(pwd)
curl -s https://raw.githubusercontent.com/PredixDev/predix-machine-templates/master/scripts/buildAndDeploy.sh > scripts/buildAndDeploy.sh
chmod 775 scripts/buildAndDeploy.sh
./scripts/buildAndDeploy.sh $*

rm -rf ./scripts/buildAndDeploy.sh

PREDIX_SERVICES_SUMMARY_FILE="$CURRENT_DIR/predix-scripts/bash/log/predix-services-summary.txt"

echo "" >> "$PREDIX_SERVICES_SUMMARY_FILE"
echo "Edge Device Specific Configuration" >> "$PREDIX_SERVICES_SUMMARY_FILE"
echo "What did we do:"  >> "$PREDIX_SERVICES_SUMMARY_FILE"
echo "We setup some configuration files in the Predix Machine container to read from a DataNode for our sensors"  >> "$PREDIX_SERVICES_SUMMARY_FILE"
echo "We installed some Intel API jar files that represent the Intel mraa and upm API" >> "$PREDIX_SERVICES_SUMMARY_FILE"
echo "We built and deployed the Machine Adapter bundle which reads from the Intel API" >> "$PREDIX_SERVICES_SUMMARY_FILE"
echo "" >> "$PREDIX_SERVICES_SUMMARY_FILE"

echo "Summary File available at $PREDIX_SERVICES_SUMMARY_FILE" "#"
cat $PREDIX_SERVICES_SUMMARY_FILE
echo "Success - the script is complete" "#"

