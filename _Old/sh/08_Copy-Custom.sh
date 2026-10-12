#!/usr/bin/env bash

# Copy custom plugins
echo "Copying custom plugins..."
cp -rv seopanel_old_*/plugins/custom_* seopanel/plugins/
echo " "

# Copy custom themes (if any)
echo "Copying custom themes (if any)..."
cp -rv seopanel_old_*/themes/custom_* seopanel/themes/
echo " "

# Copy any custom uploads or data
echo "Copying any custom uploads or data..."
cp -rv seopanel_old_*/uploads/* seopanel/uploads/
echo " "
