#!/bin/bash

# 加载通用函数库
source ./common.sh

log "正在安装TeX Live..."

# 下载 TeX Live 安装包
log "下载 TeX Live 安装包..."
download_file "https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz"

# 解压安装包
log "解压安装包..."
zcat <install-tl-unx.tar.gz | sudo tar xf - || error_exit "解压失败"

# 删除下载的安装包
log "删除下载的安装包..."
rm install-tl-unx.tar.gz

# 进入解压后的目录
cd install-tl-* || error_exit "进入目录失败"

# 运行安装脚本
log "运行安装脚本..."
sudo perl ./install-tl --no-interaction || error_exit "安装失败"

# 返回上一级目录
cd ..

# 获取安装年份
log "获取安装年份..."
export year=$(echo install-tl-* | sed -En '{s/install-tl-([0-9]{4})[0-9]{4}/\1/;p}')

# 添加 TeX Live 到 PATH 环境变量
log "添加 TeX Live 到 PATH 环境变量..."
add_to_path "/usr/local/texlive/${year}/bin/x86_64-linux"

# 删除解压后的目录
log "删除解压后的目录..."
rm -r install-tl-*

log "TeX Live 安装完成。"
