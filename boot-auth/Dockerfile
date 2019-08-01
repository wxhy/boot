FROM anapsix/alpine-java:8_server-jre_unlimited

MAINTAINER 158199521@qq.com

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN mkdir -p /boot-auth

WORKDIR /boot-auth

EXPOSE 3300

ADD ./target/boot-auth.jar ./

CMD java -Djava.security.egd=file:/dev/./urandom -Xms128m -Xmx512m -jar boot-auth.jar