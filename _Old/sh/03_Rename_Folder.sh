#!/usr/bin/env bash

# Via SSH/Terminal
cd /var/www/html  || return 1 # or your web root
mv -v "seopanel" "seopanel_old_$(date +%Y%m%d)"

# Or via FTP: Rename seopanel to seopanel_old
