FROM mysql:5.7

MAINTAINER carlos(158199521@qq.com)

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

COPY ./doc/db/schema.sql /docker-entrypoint-initdb.d

COPY ./doc/db/boot.sql /docker-entrypoint-initdb.d

COPY ./doc/db/ac.sql /docker-entrypoint-initdb.d
