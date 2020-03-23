#!/usr/bin/env bashs 

#apt update
#apt install -y curl unzip

repo="hashicorp/terraform"
latest=$(curl -s https://github.com/${repo}/releases/latest)
latest=$(echo $latest\" |grep -oP '(?<=tag\/v)[0-9][^"]*')
echo $latest

curl -L https://releases.hashicorp.com/terraform/${latest}/terraform_${latest}_linux_amd64.zip -o terraform.zip
unzip terraform.zip
mv terraform /usr/bin/
chmod +x /usr/bin/terraform
rm -f terraform.zip
terraform version
