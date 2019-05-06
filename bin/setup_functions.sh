#!/usr/bin/env bash

setup_help_message () {
if [[ ${HELP} == 1 ]]
then
    echo "Usage:"
    echo "./setup name owner \"Your Name\""
    echo "name                   - package name"
    echo "owner                  - package owner"
    echo "\"Your Name\"          - package owner name"
    echo "Options:"
    echo "  --help               - show this message"
    exit 0
fi
}

