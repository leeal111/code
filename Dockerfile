FROM ubuntu:latest

# 构建参数
ARG USER=fumen

# 系统基本配置
RUN apt update -y && apt upgrade -y
RUN echo -e "Asia\nShanghai\n" | apt install -y tzdata
RUN apt install -y git curl unzip sudo


# 创建并切换用户
RUN adduser $USER --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password
RUN echo "$USER:123123" | chpasswd
RUN usermod -aG sudo $USER
USER $USER
RUN mkdir /home/$USER/ws
WORKDIR /home/$USER/ws

# 用户基本配置
RUN echo '\nexport LANG=C.UTF-8' >> ~/.bashrc

# cpp
RUN echo '123123' |sudo -S apt install -y build-essential gdb cmake 
RUN export tag_name=$(curl -s https://api.github.com/repos/clangd/clangd/releases/latest | \
    sed -En '/tag_name/{s/^.*"tag_name".*"(.*)".*$/\1/;p}') &&\
    curl -LO https://github.com/clangd/clangd/releases/download/${tag_name}/clangd-linux-${tag_name}.zip &&\
    echo '123123' |sudo -S unzip -d /opt/ clangd-linux-${tag_name}.zip && rm clangd-linux-${tag_name}.zip &&\
    echo '\nexport PATH=/opt/clangd_'${tag_name}'/bin:$PATH' >> ~/.bashrc

# python
RUN curl -LO https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh &&\
    bash Miniconda3-latest-Linux-x86_64.sh -b && rm Miniconda3-latest-Linux-x86_64.sh &&\
    echo '\nexport PATH=~/miniconda3/bin:$PATH' >> ~/.bashrc && PATH=/home/$USER/miniconda3/bin:$PATH conda init

# go
RUN export tag_name=$(curl -s https://golang.google.cn/dl/ | \
    sed -En "/<span>go.*\.linux-amd64.tar.gz<\/span>/{s/.*<span>go(.*)\.linux-amd64.tar.gz<\/span>.*/\1/;p}") &&\
    curl -LO https://golang.google.cn/dl/go${tag_name}.linux-amd64.tar.gz &&\
    echo '123123' |sudo -S tar -C /opt -xzf go${tag_name}.linux-amd64.tar.gz && rm go${tag_name}.linux-amd64.tar.gz &&\
    echo '\nexport PATH=/opt/go/bin:$PATH' >> ~/.bashrc &&\
    echo '\nexport GOPATH=~/ws/go' >> ~/.bashrc &&\
    echo '\nexport PATH="$GOPATH/bin":$PATH' >> ~/.bashrc