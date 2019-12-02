#!/bin/bash
# Script to clone all your git repositories (ssh) in your project directory.
# Only clones if the directory does not exist.
#
# HOW TO USE
# Create the file ~/.gitrepos with the following format:
# ------------------------------------------------------
#
# REPOS=(
#  # just remove the leading "git@" and the ending ".git" from your SSH url:
#  gitlab.com:organization/repo
#  github.com:organization2/repo
#  bitbucket.com:organization3/repo
# )
# ------------------------------------------------------

PROJECTS_FOLDER="$HOME/git"
REPOS_FILE="$HOME/.gitrepos"

# ------------------------------------------------------
set -e
source ~/.gitrepos

cd $PROJECTS_FOLDER
for repo in "${REPOS[@]}"; do
    clone_to=$(echo $repo | cut -f2 -d:)
    organization=$(echo $clone_to | cut -f1 -d/)
    if [[ ! -e $clone_to ]]; then
        mkdir -p $organization
        git clone --recursive git@$repo.git $clone_to
    fi
done
