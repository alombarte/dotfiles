#!/bin/bash
brew upgrade gnupg  # This has a make step which takes a while
brew link --overwrite gnupg
brew install pinentry-mac
echo "pinentry-program /usr/local/bin/pinentry-mac" > ~/.gnupg/gpg-agent.conf
killall gpg-agent
