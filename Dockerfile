FROM ubuntu:latest
MAINTAINER Romain Aviolat <r.aviolat@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y wget curl
RUN echo "deb http://repo.powerdns.com/ubuntu xenial-auth-40 main" > /etc/apt/source.list
RUN curl https://repo.powerdns.com/FD380FBB-pub.asc | apt-key add -
RUN apt-get update && apt-get install -y mysql-client wget pdns-server pdns-backend-mysql

EXPOSE 53/tcp
EXPOSE 53/udp
EXPOSE 80

ADD pdns.sql .
ADD start.sh .
RUN chmod +x start.sh

CMD ./start.sh

