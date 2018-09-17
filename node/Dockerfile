FROM node:alpine

RUN apk update && apk upgrade && \
<<<<<<< HEAD
	apk add --no-cache git
# Other packages: bash nano
=======
	apk add --no-cache bash git
# openssh nano
>>>>>>> b38ffa533df24de785fc434ad380a61082b440a4

ARG node_env

WORKDIR /node

COPY ./node .
COPY .env ..

RUN NODE_ENV=$node_env npm install

CMD NODE_ENV=$node_env npm start
