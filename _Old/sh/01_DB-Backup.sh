#!/usr/bin/env bash

# Using mysqldump
# TODO: Define $seopanel_user and $seopanel_db.
#       Define backup folder name.
mysqldump -u $seopanel_user -p $seopanel_db > seopanel_backup_"$(date +%Y%m%d_%H%M%S)".sql

# Or using MySQL Workbench / phpMyAdmin export feature
