# 构建命令：
# docker rmi leeal111/code:latest && docker build -t leeal111/code:latest .

# 启动命令：
# docker run -it --name code --net host --mount type=volume,source=code,destination=/root/ws leeal111/code:latest

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

# cpp
RUN apt install -y build-essential gdb cmake gcc-13 g++-13
RUN export tag_name=$(curl -s https://api.github.com/repos/clangd/clangd/releases/latest | \
    sed -En '/tag_name/{s/^.*"tag_name".*"(.*)".*$/\1/;p}') &&\
    curl -LO https://github.com/clangd/clangd/releases/download/${tag_name}/clangd-linux-${tag_name}.zip &&\
    unzip -d /opt/ clangd-linux-${tag_name}.zip && rm clangd-linux-${tag_name}.zip &&\
    echo '\nexport PATH=/opt/clangd_'${tag_name}'/bin:$PATH' >> ~/.bashrc

# python
RUN curl -LO https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh &&\
    bash Miniconda3-latest-Linux-x86_64.sh -b && rm Miniconda3-latest-Linux-x86_64.sh &&\
    echo '\nexport PATH=~/miniconda3/bin:$PATH' >> ~/.bashrc && . ~/.bashrc && conda init

# go
RUN export tag_name=$(curl -s https://golang.google.cn/dl/ | \
    sed -En "/<span>go.*\.linux-amd64.tar.gz<\/span>/{s/.*<span>go(.*)\.linux-amd64.tar.gz<\/span>.*/\1/;p}") &&\
    curl -LO https://golang.google.cn/dl/go${tag_name}.linux-amd64.tar.gz &&\
    tar -C /opt -xzf go${tag_name}.linux-amd64.tar.gz && rm go${tag_name}.linux-amd64.tar.gz &&\
    echo '\nexport PATH=/opt/go/bin:$PATH' >> ~/.bashrc &&\
    echo '\nexport GOPATH=~/ws/go' >> ~/.bashrc &&\
    echo '\nexport PATH="$GOPATH/bin":$PATH' >> ~/.bashrc

# latex
# it takes long time.
RUN curl -LO https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz &&\
    zcat < install-tl-unx.tar.gz | tar xf - &&\
    rm install-tl-unx.tar.gz &&\
    export year=$(echo install-tl-* | sed -En '{s/install-tl-([0-9]{4})[0-9]{4}/\1/;p}') &&\
    echo '\nexport PATH=/usr/local/texlive/'${year}'/bin/x86_64-linux:$PATH' >> ~/.bashrc &&\
    . ~/.bashrc &&\
    cd install-tl-* &&\
    perl ./install-tl --no-interaction &&\
    cd .. &&\
    rm -r install-tl-*
RUN yes | apt install -y libfontconfig1 ttf-mscorefonts-installer 

RUN mkdir /root/ws
WORKDIR /root/ws
