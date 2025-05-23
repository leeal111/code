#!/bin/bash

# 加载通用函数库
source ./common.sh

log "正在进行系统和用户配置..."

# 系统基本配置
update_and_upgrade_system
install_packages git curl unzip

# 用户基本配置
mkdir -p ~/ws || error_exit "创建路径失败"
git config --global user.name leeal || error_exit "配置Git名称失败"
git config --global user.email leeal111@hotmail.com || error_exit "配置Git邮箱失败"

log "系统和用户配置完成。"
