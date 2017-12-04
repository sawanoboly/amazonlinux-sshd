FROM amazonlinux:latest
LABEL ref "https://github.com/sickp/docker-alpine-sshd"
LABEL maintainer "sawanoboriyu@higanworks.com"
ENTRYPOINT ["/entrypoint.sh"]
EXPOSE 22
ADD entrypoint.sh /entrypoint.sh
RUN install -d /root/.ssh -m 0700
ADD environment /root/.ssh/environment

RUN yum install -y openssh-server aws-cli ec2-utils \
  && sed -i s/PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config \
  && sed -i s/PasswordAuthentication.*/PasswordAuthentication\ yes/ /etc/ssh/sshd_config \
  && sed -i s/#PermitUserEnvironment.*/PermitUserEnvironment\ yes/ /etc/ssh/sshd_config
