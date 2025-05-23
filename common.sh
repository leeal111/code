#!/bin/bash

# 设置脚本选项
set -e # 如果命令失败则退出
set -u # 未定义变量时报错

# 定义 log 函数
log() {
  timestamp=$(date +%Y-%m-%d_%H:%M:%S)
  echo "[$timestamp] [INFO] $1"
}

# 定义 error_exit 函数
error_exit() {
  timestamp=$(date +%Y-%m-%d_%H:%M:%S)
  echo "[$timestamp] [ERROR] $1" >&2 # 输出错误消息到标准错误流
  exit 1                             # 退出脚本
}

# 检查命令是否存在
check_command() {
  command=$1
  if ! command -v "$command" &>/dev/null; then
    error_exit "$command 命令不存在。"
  fi
}

# 下载文件并检查返回码
download_file() {
  url=$1
  log "正在下载 $url"
  curl -LO "$url" || error_exit "下载 $url 失败"
}

# 添加环境变量到 ~/.bashrc
add_to_path() {
  path=$1
  log "将 $path 添加到 PATH 环境变量"
  echo -e "\nexport PATH=$path:\$PATH" >>~/.bashrc
  export PATH=$path:$PATH
}

# 更新和升级系统
update_and_upgrade_system() {
  log "更新系统包列表..."
  sudo apt-get update -y || error_exit "更新系统包列表失败"

  log "升级系统包..."
  sudo apt-get upgrade -y || error_exit "升级系统包失败"
}

# 安装包
install_packages() {
  log "正在安装包：$*"
  sudo apt-get install -y "$@" || error_exit "安装包失败"
}
