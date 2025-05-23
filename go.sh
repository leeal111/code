#!/bin/bash
tag_name=$(curl -s https://golang.google.cn/dl/ |
    sed -En "/<span>go.*\.linux-amd64.tar.gz<\/span>/{s/.*<span>go(.*)\.linux-amd64.tar.gz<\/span>.*/\1/;p}")
curl -LO https://golang.google.cn/dl/go${tag_name}.linux-amd64.tar.gz
sudo tar -C /opt -xzf go${tag_name}.linux-amd64.tar.gz
rm go${tag_name}.linux-amd64.tar.gz
echo -e "\nexport PATH=/opt/go/bin:\$PATH" >>~/.bashrc
echo -e "\nexport GOPATH=~/ws/go" >>~/.bashrc
echo -e "\nexport PATH="\$GOPATH/bin":\$PATH" >>~/.bashrc
