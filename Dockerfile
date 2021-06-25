FROM ubuntu

# 更新源，安装ssh server
RUN echo "deb http://mirrors.163.com/ubuntu precise main universe" >/etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd

# 设置root ssh远程登录密码为123456
RUN echo "root:Wwg01269+!" | chpasswd

# 容器需要开放SSH 22端口
EXPOSE 22

CMD [ "/usr/sbin/sshd" ]