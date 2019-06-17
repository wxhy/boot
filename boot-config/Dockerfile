FROM anapsix/alpine-java:8_server-jre_unlimited

MAINTAINER 158199521@qq.com

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN mkdir -p /boot-config

WORKDIR /boot-config

EXPOSE 8888

ADD ./boot-config/target/boot-config.jar ./

CMD java -Djava.security.egd=file:/dev/./urandom -jar boot-config.jar