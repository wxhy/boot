FROM node

MAINTAINER 158199521@qq.com

RUN mkdir -p /front/web

WORKDIR /front/web/

USER root

COPY package.json ./

RUN yarn --registry https://registry.npm.taobao.org || npm install --registry https://registry.npm.taobao.org

COPY ./ ./


CMD  ["npm", "run", "build"]

