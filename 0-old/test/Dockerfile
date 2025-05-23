# 构建和启动命令：
# docker rmi code_test:latest && docker build --progress=plain -t code_test:latest ./test && docker run -it --rm --net host code_test:latest

FROM ubuntu:latest

# 系统基本配置
RUN echo '\ndeb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy main restricted universe multiverse' > /etc/apt/sources.list
RUN echo '\ndeb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-updates main restricted universe multiverse' >> /etc/apt/sources.list
RUN echo '\ndeb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-backports main restricted universe multiverse' >> /etc/apt/sources.list
RUN echo '\ndeb http://security.ubuntu.com/ubuntu/ jammy-security main restricted universe multiverse' >> /etc/apt/sources.list
RUN apt update -y && apt upgrade -y
RUN apt install -y ca-certificates
RUN echo '\ndeb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy main restricted universe multiverse' > /etc/apt/sources.list
RUN echo '\ndeb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-updates main restricted universe multiverse' >> /etc/apt/sources.list
RUN echo '\ndeb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-backports main restricted universe multiverse' >> /etc/apt/sources.list
RUN echo '\ndeb http://security.ubuntu.com/ubuntu/ jammy-security main restricted universe multiverse' >> /etc/apt/sources.list
RUN echo -e "Asia\nShanghai\n" | apt install -y tzdata
RUN apt install -y git curl unzip

# 用户基本配置
RUN echo '\nexport LANG=C.UTF-8' >> ~/.bashrc
RUN echo '\nalias sudo=' >> ~/.bashrc

### 测试内容开始

### 测试内容结束

RUN mkdir /root/ws
WORKDIR /root/ws
