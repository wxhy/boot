FROM anapsix/alpine-java:8_server-jre_unlimited

MAINTAINER 158199521@qq.com

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN mkdir -p /boot-upms

WORKDIR /boot-upms

EXPOSE 8087

ADD ./boot-upms/boot-upms-server/target/boot-upms-server.jar ./

CMD java -Djava.security.egd=file:/dev/./urandom -jar boot-upms-server.jar