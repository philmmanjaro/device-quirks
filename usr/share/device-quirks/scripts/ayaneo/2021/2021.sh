#!/bin/bash
if [ $(whoami) != 'root' ]; then
  echo "You must be root to run this script."
  exit 1
fi
 
source /etc/device-quirks.conf
if [[ $USE_FIRMWARE_OVERRIDES == 1 ]]; then
  # Do DSDT override.
  echo "Enabling DSDT Override"
  $DQ_PATH/scripts/override_dsdt "ayaneo_2021.dsl"
else
  echo "Firmware overrides are disabled, skipping...\n"
  echo "To enable firmware overrides, edit /etc/device-quirks/device-quirks.conf"
fi
