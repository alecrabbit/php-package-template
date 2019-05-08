#!/usr/bin/env sh
### Treat unset variables as an error.
set -u


die() {
  [ $# -gt 0 ] && echo "error: $*" >&2
  exit 1
}

### Base directory
BASE_FILENAME=$(basename "$0")
BASE_DIR=$(dirname "$0")
LIB_SOURCE='.lib'
LIB_DIR="${BASE_DIR}/${LIB_SOURCE}"

### Load libraries(DO NOT CHANGE LOAD ORDER)
. "${LIB_DIR}/ppt_core" || die "Unable to load 'ppt_core' library."
. "${LIB_DIR}/ppt_functions" || die "Unable to load 'ppt_functions' library."
. "${LIB_DIR}/ppt_helpers" || die "Unable to load 'ppt_helpers' library."

### Configure color
_ppt_configureColor ${PPT_COLOR}

### Read options
_ppt_read_options "$@"

### Reassign directories
BASE_DIR=$(_ppt_realpath ${BASE_DIR})
LIB_DIR="${BASE_DIR}/${LIB_SOURCE}"

### Set Version
PPT_VERSION=$(cat "${LIB_DIR}/VERSION")

if [ ${PPT_DEBUG} -eq 1 ]
then
    _ppt_notice "DEBUG Enabled"
fi
_ppt_debug "Filename '${BASE_FILENAME}'"
if [ ${_ppt_silent_setup:-${PPT_FALSE}} -eq ${PPT_TRUE} ]
then
    _ppt_debug "Option '-y' used: no confirmation needed"
fi

### Declare variables
_ppt_declare_variables_defaults "${__ppt_param1}" "${__ppt_param2}" "${__ppt_param3}"
unset  __ppt_param1 __ppt_param2 __ppt_param3

### Check if user is 'root'
_ppt_check_user

### Greeting
_ppt_info "🔧 Package template setup..."
_ppt_dark "Version ${PPT_VERSION}"

### Set terminal title
_ppt_set_terminal_title "🧰 Setup script..."

### Check if '.settings' dir exists and is consistent
_ppt_check_if_dir_exists ${_PPT_SETTINGS_DIR}
if [ $? -eq ${PPT_TRUE} ]
then
    _ppt_settings_dir_is_consistent && _ppt_dark "Found saved settings" || _ppt_fatal "Saved settings are inconsistent."
    _ppt_load_values
    ### Read data from '.settings' dir
else
    _ppt_debug "Package settings not found"
    ### Ask user for data
    _ppt_ask_values

    ### Save data to '.settings' dir
fi

### Make setup here

### Set terminal title - to dir name
_ppt_set_terminal_title "$(basename $(pwd))"

### Debug code
_ppt_show_messages
#_ppt_echo_variables
#echo ${__ppt_ansi_dark}
#cat LICENSE
#echo ${__ppt_ansi_none}

#_ppt_dark "dark"
