#!/usr/bin/env bash

setup_help_message () {
if [[ ${HELP} == 1 ]]
then
    echo "Options:"
    echo "    --help                 - show this message"
    echo "Usage(positional arguments):"
    echo "./setup name owner \"Your Name\""
    echo "    name                   - package name"
    echo "    owner                  - package owner"
    echo "    \"Your Name\"            - package owner name"
    exit 0
fi
}

add_origin () {
    param_package_owner="$1"
    param_package_name="$2"
    remote="https://github.com/${param_package_owner}/${param_package_name}.git"
    if [[ $(ask_question "Add remote on '${remote}'?") == 1 ]]
    then
        git remote add origin "${remote}"
        echo
        dark "Added remote ${remote}"
    fi
}

ask_question () {
    read -p "$(dark "Timeout 10 seconds...") ${1} " -n 1 -r -t 10
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        return 1
    fi
    return 0
}