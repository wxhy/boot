FROM anapsix/alpine-java:8_server-jre_unlimited

MAINTAINER 158199521@qq.com

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN mkdir -p /boot-gateway

WORKDIR /boot-gateway

EXPOSE 8081

ADD ./target/boot-gateway.jar ./

CMD java -Djava.security.egd=file:/dev/./urandom -jar boot-gateway.jar