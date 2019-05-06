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

