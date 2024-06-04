# build command: docker build --network host -t test . && docker run -it --rm test

FROM ubuntu:latest

# build proxy (optional and you need set up your proxy server)
ENV http_proxy "http://127.0.0.1:7890"
ENV HTTP_PROXY "http://127.0.0.1:7890"
ENV https_proxy "http://127.0.0.1:7890"
ENV HTTPS_PROXY "http://127.0.0.1:7890"

COPY build.sh /root/.config/
COPY init.bashrc /root/.config/bash/
COPY nvim /root/.config/

# RUN bash /root/.config/build.sh

WORKDIR /root/workspace