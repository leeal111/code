# code

## 构建镜像
```bash
docker build -t leeal111/code:latest .
```

## 创建容器
```bash
docker run -it --name code --net host leeal111/code:latest
```