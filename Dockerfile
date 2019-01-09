FROM centos:centos7
MAINTAINER Tommaso Borgato <tborgato@redhat.com>

RUN yum -y update; yum clean all
RUN yum -y install openssh-server passwd; yum clean all
RUN yum -y install unzip; yum clean all
RUN yum -y install wget; yum clean all
ADD script/start.sh /start.sh
RUN mkdir -p /var/run/sshd

RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''

RUN chmod 755 /start.sh
EXPOSE 22
RUN ./start.sh

ENTRYPOINT ["/usr/sbin/sshd", "-D"]