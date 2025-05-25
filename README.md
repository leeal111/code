# code

本项目旨在记录个人开发过程中的各种编程语言和工具的安装及配置细节。由于 Windows 环境下的大多数开发工具都支持设置同步，因此本项目侧重于提供 Linux 环境下的开发配置信息。项目假设在 WSL（Windows Subsystem for Linux）环境中运行，涉及某些 Windows 程序的配置将通过 WSL 对 Windows 驱动器的自动挂载功能来实现无缝集成。

## 环境概览

- Ubuntu
- C++
- Python
- Go
- Latex
- Java

## 项目运行

本项目仅仅依赖于 Bash，所以启动非常简单，即：

```bash
./main.sh
```

注意，由于存在一些命令需要root权限，所以可能需要手动输入sudo密码。

注意，如果是WSL系统，你可以通过下面的方式快速为Latex安装一些非开源字体：

```bash
# 将 Windows 的字体目录软链接到 WSL 的字体目录，
sudo ln -s /mnt/c/Windows/Fonts /usr/share/fonts/win-fonts

# 刷新字体缓存
fc-cache -fv
```
