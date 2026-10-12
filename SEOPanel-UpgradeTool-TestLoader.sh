#!/bin/env bash

# SEOPanel-UpgradeTool TestLoader
# DEPRICATED by AdvPreLoader.sh

# TODO: Sanity Checks
#        - Do folders exist?
#        - Do files exist?

FuncDir="functions"
ConfigDir="config"

# Create the array
FuncList=(
    "Cecho.bfunc"
    "01_DB-Backup.bfunc"
    "02_Files-Backup.bfunc"
    "03_Rename_Folder.bfunc"
    "04_Download-Latest.bfunc"
    "05_Extract-Latest.bfunc"
    "06_Copy-Config.bfunc"
    "07_Update-Config.php"
    "08_Copy-Custom.bfunc"
    "09_Set-Permissions.bfunc"
    "10_Run-Upgrade.bfunc"
    "11_Delete_InstallFolder.bfunc"
    "12_Clear-Cache.bfunc"
    "13_Update-Cron.bfunc"
)

# Run through each file in the array
echo "Sourcing Functions:"
for funcfile in "${FuncList[@]}"; do
    echo "Sourcing: $funcfile"
    # To actually run the files, uncomment the line below:
    source "$funcfile"
done

# Create the array
ConfList=(
    "colors.conf"
    "DB-Backup.conf"
    "Files-Backup.conf"
    "SEOPanel-UpgradeTool.conf"    
)

# Run through each file in the array
echo "Sourcing Configs:"
for configfile in "${ConfList[@]}"; do
    echo "Sourcing: $configfile"
    # To actually run the files, uncomment the line below:
    source "$configfile"
done
