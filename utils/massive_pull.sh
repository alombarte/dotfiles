#!/bin/bash
# Script to git pull all your git repositories (declared in ~/.gitrepos).

PROJECTS_FOLDER="$HOME/git"
REPOS_FILE="$HOME/.gitrepos"

# ------------------------------------------------------
set -e

cd "$PROJECTS_FOLDER"
while read -r repo; do
    { [[ "$repo" =~ ^#.*$ ]] || [[ -z "$repo" ]]; } && continue
    clone_to=$(echo "$repo" | cut -f2 -d:)
    if [[  -e $clone_to ]]; then
        echo "Pulling $PROJECTS_FOLDER/$clone_to"
        git -C "$PROJECTS_FOLDER/$clone_to" pull
    fi
done < "$REPOS_FILE"
