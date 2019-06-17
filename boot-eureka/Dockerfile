FROM anapsix/alpine-java:8_server-jre_unlimited

MAINTAINER 158199521@qq.com

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN mkdir -p /boot-eureka

WORKDIR /boot-eureka

EXPOSE 9999

ADD ./boot-eureka/target/boot-eureka.jar ./

CMD java -Djava.security.egd=file:/dev/./urandom -jar boot-eureka.jar