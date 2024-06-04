FROM ubuntu:latest

COPY script/build.sh /root/.config/

COPY config/init.bashrc /root/.config/bash/

RUN bash /root/.config/build.sh

COPY config/nvim /root/.config/nvim/

WORKDIR /root/workspace