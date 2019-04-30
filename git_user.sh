#!/usr/bin/env bash
git_user_email="$(git config user.email)"
if [[ -z "$git_user_email" ]]
then
    exit 1
fi
git_user_name="$(git config user.name)"
if [[ -z "$git_user_name" ]]
then
    exit 1
fi
exit 0