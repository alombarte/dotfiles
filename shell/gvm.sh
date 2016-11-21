#/bin/bash
# Install GVM
[[ ! -d "$HOME/.gvm" ]] && GVM_NO_UPDATE_PROFILE=1 GVM_NO_GIT_BAK=1 bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
# gvm subcommand fails in bash script: https://github.com/moovweb/gvm/issues/188
[[ -s "$GVM_ROOT/scripts/gvm" ]] && source "$GVM_ROOT/scripts/gvm"

gvm install go1.7.1
gvm use go1.7.1

# Apache Benchmark replacement
go get -u github.com/rakyll/hey
go install github.com/rakyll/hey
