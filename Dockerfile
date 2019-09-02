# 说明该镜像以哪个镜像为基础
FROM python:3.7

COPY . /app
WORKDIR /app

ENV MODE server
# 添加时间与主机同步
ENV TimeZone=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TimeZone /etc/localtime && echo $TimeZone > /etc/timezone   #使用软连接，并且将时区配置覆盖/etc/timezone

# 构建者的基本信息
MAINTAINER DoubleThunder <sfyc23@gmail.com>

RUN pip install -r requirements.txt

ENTRYPOINT ["python","run.py"]
