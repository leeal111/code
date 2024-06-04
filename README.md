# code

## 目的

从任意基础镜像，构建个人的编程环境（bash、tmux、nvim）

## Usage

测试：
```bash
docker build --network host -t test . && docker run -it --rm test
docker rmi $(docker images -f "dangling=true" -q)
```

## 阶段性目标

- 在ubuntu:latest基础上构建基于nvim编辑器的python编程环境