FROM node:alpine

# RUN apk add --no-cache bash nano

ARG node_env

WORKDIR /node

COPY ./node .
COPY .env ..

RUN NODE_ENV=$node_env npm install

CMD NODE_ENV=$node_env npm start
