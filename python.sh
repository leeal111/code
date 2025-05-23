#!/bin/bash

# 加载通用函数库
source ./common.sh

log "正在安装Python..."

# 下载 Miniconda 安装脚本
download_file "https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh"

# 运行 Miniconda 安装脚本
log "运行 Miniconda 安装脚本..."
bash Miniconda3-latest-Linux-x86_64.sh -b || error_exit "Miniconda 安装脚本运行失败"

# 删除下载的安装脚本
log "删除下载的安装脚本..."
rm Miniconda3-latest-Linux-x86_64.sh

# 添加 Miniconda 到 PATH
add_to_path "~/miniconda3/bin"

# 初始化 Conda
log "初始化 Conda..."
conda init || error_exit "Conda 初始化失败"

log "Python安装完成。"
