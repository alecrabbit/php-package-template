#!/usr/bin/env sh
### Treat unset variables as an error.
set -u

die() {
  [ $# -gt 0 ] && echo "error: $*" >&2
  exit 1
}

### Set color output
PPT_COLOR=${PPT_COLOR:-auto} # Options are 'never', 'always', or 'auto'.

LIB_SOURCE='.lib'
### Base directory
BASE_DIR=$(dirname "$0")
LIB_DIR="${BASE_DIR}/${LIB_SOURCE}"

### Load libraries(DO NOT CHANGE LOAD ORDER)
. "${LIB_DIR}/ppt_core" || die "Unable to load 'ppt_core' library."
. "${LIB_DIR}/ppt_functions" || die "Unable to load 'ppt_functions' library."
. "${LIB_DIR}/ppt_helpers" || die "Unable to load 'ppt_helpers' library."

### Reassign
BASE_DIR=$(_ppt_realpath ${BASE_DIR})
LIB_DIR="${BASE_DIR}/${LIB_SOURCE}"

### Load Version
PPT_VERSION=$(cat "${LIB_DIR}/VERSION")

### Configure color
_ppt_configureColor ${PPT_COLOR}

### Declare variables
_ppt_declare_variables_defaults

### Read positional arguments
param_package_name="${1:-}"
param_owner="${2:-}"
param_owner_name="${3:-}"

### Check if user is 'root'
_ppt_check_user

### Check arguments
for arg
do
    case "$arg" in
        --help)
            _ppt_help_message
            ;;
        -y)
            silent_setup=${PPT_TRUE}
            ;;
    esac
done

### Set terminal title
_ppt_info "🔧 Package template setup..."
_ppt_dark "Version ${PPT_VERSION}"
_ppt_set_terminal_title "🧰 Setup script..."

### Check if '.settings' dir exists and is consistent
_ppt_check_if_dir_exists ${_PPT_SETTINGS_DIR}
if [ $? -eq ${PPT_TRUE} ]
then
    _ppt_settings_dir_is_consistent && _ppt_dark "Found saved settings" || _ppt_fatal "Saved settings are inconsistent."
    ### Read data from '.settings' dir
else
    _ppt_dark "Saved settings not found"
    ### Ask user for data
    ### Save data to '.settings' dir
fi

### Make setup here
if [ ${silent_setup} -eq ${PPT_TRUE} ]
then
    _ppt_info "No confirmation needed"
fi

### Set terminal title - to dir name
_ppt_set_terminal_title "$(basename $(pwd))"

### Debug code
#_ppt_echo_variables
#echo ${__ppt_ansi_dark}
#cat LICENSE
#echo ${__ppt_ansi_none}

#_ppt_dark "dark"
