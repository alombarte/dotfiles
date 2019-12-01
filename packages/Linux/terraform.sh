# !/bin/bash
# Manual installation of terraform (packages are way behind)

VERSION=0.12.16
echo "What version of terraform do you wish to install?"
echo "See https://releases.hashicorp.com/terraform/"
read -p "Version: [${VERSION}] " target
if test -z "$target" 
then
      target=$VERSION
fi
read -p "Proceed with $target? (Y/N): " confirm && [[ $confirm == [yY] ]] || exit 0

wget https://releases.hashicorp.com/terraform/${target}/terraform_${target}_linux_amd64.zip
unzip terraform_${target}_linux_amd64.zip
rm terraform_${target}_linux_amd64.zip
sudo mv terraform /usr/local/bin
terraform -v