#!/usr/bin/env bash

# BLING PreLoader Utility
PreLoader_Version="26.10"
#	- Fixed output bug on Line 66: ${reset} was missing.
#	- Moved to Colors2.conf
#	- Colorized folder not found messasge on Line 73
#	- Improved ASCII Headings
#	- Moved preloading to individial functions


# TODO: Add to BLING
# 	Enable Cecho

####################################################################################################################################
# Define Files and Folders #																									   #
####################################################################################################################################

# Colors for Cecho-like output
COLORS_FILE="Colors2.conf"

# Source our Color Config
if [ -f "$CONFIG_DIR"/"$COLORS_FILE" ]; then
        source "$CONFIG_DIR"/"$COLORS_FILE"
fi


CONFIG_DIR="$(pwd)/config"
# CONFIG_FILE="test.ini"
#  CONFIG_FILE="config.ini"
  CONFIG_FILE="SEOPanel-UpgradeTool.conf"

FUNC_DIR="$(pwd)/functions"
  FUNC_FILE="lib_ini.bfunc"

PROFILE_DIR="$(pwd)/profiles"

####################################################################################################################################
# Runtime Configuration #																										   #
####################################################################################################################################

PRELOAD_CONFIGS="TRUE"
PRELOAD_FUNCTIONS="TRUE"
PRELOAD_PROFILES="FALSE"

####################################################################################################################################
# Display Functions #																											   #
####################################################################################################################################

echo " "
echo "BLING PreLoader Utility - Version $PreLoader_Version"
echo "-----------------------------------------------------"
echo " "

function DisplayLine() {
	echo " ${brightblue}__________________________________________________${reset}"
}

function NewLine() {
	echo " "
}


####################################################################################################################################
# Source If Exists Function # 																									   #
####################################################################################################################################
# Function to source files in a given directory with a specific extension

source_files_if_exist() {
    local dir="$1"
    local pattern="$2"
    if [[ -d "$dir" ]]; then
        echo "${brightwhite} Sourcing files from: ${brightyellow} $dir ${reset}"
	echo "-------------------------------------------------------------------------------------------"
	# Use a glob to find matching files and loop through them
        for file in "$dir"/$pattern; do
            # Check if the glob found actual files (and not just the literal pattern if no files match)
            if [[ -f "$file" ]]; then
                echo "  ${brightyellow} Sourcing: ${brightblue} $file ${reset}"
                source "$file"
            fi
        done
    else
        echo "${red} Directory not found: $dir ${reset}"
    fi
}

# DisplayLine

####################################################################################################################################
# Define Sourcing Functions: Configs / Functions / Profiles #																	   #
####################################################################################################################################

function PreLoad_Configs() {
## source_files_if_exist "config" "*.conf"
# source_files_if_exist "$(pwd)/config" "*.conf"
source_files_if_exist "$CONFIG_DIR" "*.conf"
# DisplayLine
NewLine
}

function PreLoad_Functions() {
# Source function files
## source_files_if_exist "functions" "*.bfunc"
# source_files_if_exist "$(pwd)/functions" "*.bfunc"
source_files_if_exist "$FUNC_DIR" "*.bfunc"
# DisplayLine
NewLine
}
function PreLoad_Profiles() {
# Source profile files
## source_files_if_exist "profiles" "*.bprofile"
source_files_if_exist "$(pwd)/profiles" "*.bprofile"
source_files_if_exist "$PROFILE_DIR" "*.bprofile"
# DisplayLine
NewLine
}

####################################################################################################################################
# MAIN PROGRAM #																												   #
####################################################################################################################################

# Only Run PreLoaders When Set To TRUE under Runtime Configuration.
	# Check and run PreLoad_Configs if Enabled
	[[ "$PRELOAD_CONFIGS" == "TRUE" ]] && PreLoad_Configs

	# Check and run PreLoad_Functions if Enabled
	[[ "$PRELOAD_FUNCTIONS" == "TRUE" ]] && PreLoad_Functions

	# Check and run PreLoad_Profiles if Enabled
	[[ "$PRELOAD_PROFILES" == "TRUE" ]] && PreLoad_Profiles



DisplayLine
echo "Advanced Preload Completed."
NewLine
