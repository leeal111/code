#!/bin/bash

# 加载通用函数库
source ./common.sh

log "正在安装C++..."

# 安装开发工具
install_packages build-essential gdb cmake gcc-13 g++-13

# 获取最新的 clangd 版本
log "获取最新的 clangd 版本..."
tag_name=$(curl -s https://api.github.com/repos/clangd/clangd/releases/latest |
    sed -En '/tag_name/{s/^.*"tag_name".*"(.*)".*$/\1/;p}')
log "最新版本为 $tag_name"

# 下载 clangd
download_file "https://github.com/clangd/clangd/releases/download/$tag_name/clangd-linux-$tag_name.zip"

# 解压 clangd
sudo unzip -d "/opt/" "clangd-linux-$tag_name.zip" || error_exit "解压失败"

# 删除下载的 zip 文件
log "删除下载的文件..."
rm "clangd-linux-$tag_name.zip"

# 添加到 PATH
add_to_path "/opt/clangd_$tag_name/bin"

log "C++安装完成。"
