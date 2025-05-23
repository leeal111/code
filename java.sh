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

# 下载Maven
log "下载Maven..."
download_file https://dlcdn.apache.org/maven/maven-3/3.9.5/binaries/apache-maven-3.9.5-bin.tar.gz

# 解压Maven
log "解压Maven..."
sudo tar -zxvf apache-maven-3.9.5-bin.tar.gz -C /usr/local

# 删除下载的安装包
log "删除下载的安装包..."
rm apache-maven-3.9.5-bin.tar.gz

# 重命名目录
log "重命名Maven目录..."
sudo mv /usr/local/apache-maven-3.9.5 /usr/local/maven

# 设置环境变量
log "设置环境变量..."
echo -e "\nexport MAVEN_HOME=/usr/local/maven" >> ~/.bashrc
echo -e "\nexport PATH=\$MAVEN_HOME/bin:\$PATH" >> ~/.bashrc

log "Java 安装完成。"



