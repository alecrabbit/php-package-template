#!/usr/bin/env sh
### Treat unset variables as an error.
set -u

die() {
  [ $# -gt 0 ] && echo "error: $*" >&2
  exit 1
}

### Base constants
BASE_FILENAME=$(basename "$0")
BASE_DIR=$(dirname "$0")
LIB_SOURCE='.lib'
LIB_DIR="${BASE_DIR}/${LIB_SOURCE}"

### Load libraries(DO NOT CHANGE LOAD ORDER)
. "${LIB_DIR}/ppt_core" || die "Unable to load 'ppt_core' library."
. "${LIB_DIR}/ppt_functions" || die "Unable to load 'ppt_functions' library."
. "${LIB_DIR}/ppt_helpers" || die "Unable to load 'ppt_helpers' library."

### Set Version
PPT_VERSION=$(cat "${LIB_DIR}/VERSION")

### Configure color
_ppt_configureColor ${PPT_COLOR}

### Reassign directories using realpath
BASE_DIR=$(_ppt_realpath ${BASE_DIR})
LIB_DIR="${BASE_DIR}/${LIB_SOURCE}"

if [ ${PPT_DEBUG} -eq 1 ]
then
    _ppt_notice "DEBUG Enabled"
fi
_ppt_debug "Filename '${BASE_FILENAME}'"

### Read options
_ppt_read_options "$@"

### Declare variables
_ppt_declare_variables_defaults "${__ppt_param1}" "${__ppt_param2}" "${__ppt_param3}" "${__ppt_param4}"
__ppt_use_empty_owner_namespace=${__ppt_param5}
unset  __ppt_param1 __ppt_param2 __ppt_param3 __ppt_param4 __ppt_param5

### Check if user is not 'root'
_ppt_check_user

### Greeting
_ppt_info "🔧 Package template setup..."
_ppt_dark "Version ${PPT_VERSION}"

### Set terminal title
_ppt_set_terminal_title "🧰 Setup script..."
if [ ${__ppt_use_empty_owner_namespace} -eq ${PPT_TRUE} ]
then
    _ppt_package_owner_namespace=""
fi
unset  __ppt_use_empty_owner_namespace

### Check if '.settings' dir exists and is consistent
if _ppt_check_if_dir_exists ${_PPT_SETTINGS_DIR}
then
    _ppt_settings_dir_is_consistent || _ppt_fatal "Saved settings are inconsistent."
    _ppt_load_values
    ### Read data from '.settings' dir
else
    _ppt_debug "Package settings not found"
    _ppt_debug ${_ppt_silent_setup}
    if [ ${_ppt_silent_setup} -eq ${PPT_FALSE} ]
    then
        ### Ask user for data
        _ppt_ask_values
    else
        _ppt_debug "Option '-y' used: no confirmation needed"
    fi

    ### Save data to '.settings' dir
    _ppt_save_values
fi
_ppt_info "Preparing setup"
_ppt_info "Using values:"
_ppt_show_values
_ppt_dark ""
_ppt_create_files_from_templates
_ppt_info "Files prepared"

### Make setup here
if _ppt_continue_setup; then
    _ppt_make_setup
fi

### Set terminal title - to dir name
_ppt_set_terminal_title "$(basename $(pwd))"

if _ppt_check_git_user
then
    _ppt_debug "Git user configured"
fi


### Debug code
#_ppt_show_messages
#_ppt_echo_variables
#echo ${__ppt_ansi_dark}
#cat LICENSE
#echo ${__ppt_ansi_none}

#_ppt_dark "dark"
