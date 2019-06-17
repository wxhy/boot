FROM anapsix/alpine-java:8_server-jre_unlimited

MAINTAINER 158199521@qq.com

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN mkdir -p /boot-activiti

WORKDIR /boot-activiti

EXPOSE 8082

ADD ./boot-modules/boot-activiti/target/boot-activiti.jar ./

CMD java -Djava.security.egd=file:/dev/./urandom -jar boot-activiti.jar