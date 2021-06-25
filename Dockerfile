FROM ubuntu

# 更新源，安装ssh server
RUN apt-get update && apt-get install -y openssh-server && mkdir /var/run/sshd \
    # 设置root ssh远程登录密码为123456
    && echo "root:Wwg01269+!" | chpasswd \
    && sed -i 's/PermitRootLogin\swithout-password/PermitRootLogin yes/g' /etc/ssh/sshd_config


# 容器需要开放SSH 22端口
EXPOSE 22

CMD /usr/sbin/sshd -D