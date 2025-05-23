#!/bin/bash
# 系统基本配置
sudo apt update -y && sudo apt upgrade -y
sudo apt install -y git curl unzip

# 用户基本配置
mkdir ~/ws
git config --global user.name leeal
git config --global user.email leeal111@hotmail.com