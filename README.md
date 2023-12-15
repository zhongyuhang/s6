# 项目简介

尝试使用s6来启动容器，达到单容器启动多个进程的目的。
本项目是使用s6启动了两个非常简单的flask进程，分别启动在端口5001和5002。

## s6是什么？

[http://bazingafeng.com/2019/12/24/s6-and-s6-overlay/](http://bazingafeng.com/2019/12/24/s6-and-s6-overlay/)

## 文件介绍

- `app.py` flask项目1的启动文件
- `app2.py` flask项目2的启动文件
- `docker-compose.yml` 不解释
- `Dockerfile` 不解释
- `flask-run` s6启动flask项目1的脚本
- `flask-run-2` s6启动flask项目2的脚本
- `s6-overlay-noarch.tar.xz` s6文件（启动s6需要的）
- `s6-overlay-x86_64.tar.xz` s6文件（启动s6需要的）

## 运行步骤

```shell
1. 使用Dockerfile构建镜像
docker build -t demo .

2. 启动容器
docker-compose up -d

3. 测试
curl your_ip:5001
> hello buddy!

curl your_ip:5002
> hello buddy2!
```
