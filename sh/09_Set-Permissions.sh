#!/usr/bin/env bash

# Set proper ownership (replace www-data with your web server user)
chown -R www-data:www-data seopanel/

# Set directory permissions
find seopanel/ -type d -exec chmod 755 {} \;

# Set file permissions
find seopanel/ -type f -exec chmod 644 {} \;

# Set tmp directory writable
chmod 755 seopanel/tmp/
