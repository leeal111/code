#!/bin/bash

# 加载通用函数库
source ./common.sh

log "正在安装Java..."

# 安装 OpenJDK 21
log "安装 OpenJDK 21..."
install_packages openjdk-21-jdk

# 设置 JAVA_HOME 环境变量
log "设置 JAVA_HOME 环境变量..."
JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:/bin/java::")
echo -e "\nexport JAVA_HOME=$JAVA_HOME" >> ~/.bashrc
echo -e "\nexport PATH=\$JAVA_HOME/bin:\$PATH" >> ~/.bashrc

log "Java 安装完成。"