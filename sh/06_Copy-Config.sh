#!/usr/bin/env bash

# Copy your old config to new installation
cp seopanel_old_*/config/sp-config.php seopanel/config/

# If that file doesn't exist, copy from sample
cp seopanel/config/sp-config-sample.php seopanel/config/sp-config.php
