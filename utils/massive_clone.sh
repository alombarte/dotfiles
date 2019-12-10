#!/bin/bash
# Script to clone all your git repositories (ssh) in your project directory.
# Only clones them if the directory does not exist.
#
# Example of usage:
# echo "github.com:alombarte/dotfiles" >> ~/.gitrepos
# ./multiple_clone.sh

# The file ~/.gitrepos contains one line per repo.
# The format of each line is the ssh clone url but
# without the leading 'git@' and the ending '.git'
# Example:
#
#  # Comments (#) and empty lines are allowed
#  gitlab.com:organization/repo
#  github.com:organization2/repo
#  bitbucket.com:organization3/repo

PROJECTS_FOLDER="$HOME/git"
REPOS_FILE="$HOME/.gitrepos"

# ------------------------------------------------------
set -e

cd "$PROJECTS_FOLDER"
while read -r repo; do
    { [[ "$repo" =~ ^#.*$ ]] || [[ -z "$repo" ]]; } && continue
    clone_to=$(echo "$repo" | cut -f2 -d:)
    organization=$(echo "$clone_to" | cut -f1 -d/)
    if [[ ! -e $clone_to ]]; then
        mkdir -p "$organization"
        git clone --recursive "git@$repo.git" "$clone_to"
    fi
done < "$REPOS_FILE"
