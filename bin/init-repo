#!/bin/bash

die() { echo "$*" 1>&2 ; exit 1; }

if [[ -z $DEV_REPO ]]; then
    die "Set environment variable DEV_REPO before running; DEV_REPO=git@example.com:namespace"
fi

REPO="${DEV_REPO}/${1}.git"
BRANCH="main"

git init
git add -A
git commit -m "Initial commit"
git push -u $REPO $BRANCH
git remote add origin $REPO