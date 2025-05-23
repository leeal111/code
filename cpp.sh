#!/bin/bash
sudo apt install -y build-essential gdb cmake gcc-13 g++-13
tag_name=$(curl -s https://api.github.com/repos/clangd/clangd/releases/latest |
    sed -En '/tag_name/{s/^.*"tag_name".*"(.*)".*$/\1/;p}')
curl -LO https://github.com/clangd/clangd/releases/download/${tag_name}/clangd-linux-${tag_name}.zip
sudo unzip -d /opt/ clangd-linux-${tag_name}.zip
rm clangd-linux-${tag_name}.zip
echo -e "\nexport PATH=/opt/clangd_${tag_name}/bin:\$PATH" >>~/.bashrc
