#!/bin/bash

# 加载通用函数库
source ./common.sh

log "主脚本 main.sh 开始执行..."

bash ./basic.sh

bash ./cpp.sh

bash ./python.sh

bash ./go.sh

bash ./latex.sh

bash ./java.sh

log "main.sh 执行完成。"
