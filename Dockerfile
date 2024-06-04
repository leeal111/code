FROM ubuntu:latest

# build proxy (optional and you need set up your proxy server)
ENV http_proxy "http://127.0.0.1:7890"
ENV HTTP_PROXY "http://127.0.0.1:7890"
ENV https_proxy "http://127.0.0.1:7890"
ENV HTTPS_PROXY "http://127.0.0.1:7890"

COPY script/build.sh /root/.config/

COPY config/init.bashrc /root/.config/bash/

RUN bash /root/.config/build.sh

COPY config/nvim /root/.config/nvim/

WORKDIR /root/.config
# WORKDIR /root/workspace