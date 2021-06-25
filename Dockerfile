FROM ubuntu

ENV password=Wwg01269+!

# 更新源，安装ssh server
RUN apt-get update && apt-get install -y openssh-server && mkdir /var/run/sshd \
    # 设置root ssh远程登录密码为123456
    && echo "root:${password}" | chpasswd \
    # 允许root用户远程ssh登录
    && sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config \
    # 允许使用密码连接ssh服务
    && sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config

# 容器需要开放SSH 22端口
EXPOSE 22

CMD /usr/sbin/sshd -D