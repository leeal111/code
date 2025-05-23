#!/bin/bash

# 加载通用函数库
source ./common.sh

log "正在安装Go..."

# 获取最新的 Go 版本号
log "获取最新的 Go 版本号..."
tag_name=$(curl -s https://golang.google.cn/dl/ |
    sed -En "/<span>go.*\.linux-amd64.tar.gz<\/span>/{s/.*<span>go(.*)\.linux-amd64.tar.gz<\/span>.*/\1/;p}")
log "最新版本为 $tag_name"

# 下载 Go 安装包
download_file "https://golang.google.cn/dl/go${tag_name}.linux-amd64.tar.gz"

# 解压 Go 安装包到 /opt 目录
log "解压 Go 安装包到 /opt 目录..."
sudo tar -C /opt -xzf "go${tag_name}.linux-amd64.tar.gz" || error_exit "解压失败"

# 删除下载的安装包
log "删除下载的安装包..."
rm "go${tag_name}.linux-amd64.tar.gz"

# 添加 Go 和 GOPATH 到 PATH 环境变量
add_to_path "/opt/go/bin"
log "设置 GOPATH 环境变量..."
echo -e "\nexport GOPATH=~/ws/go" >>~/.bashrc
add_to_path "\$GOPATH/bin"

log "Go安装完成。"
