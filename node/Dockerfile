FROM node:alpine

RUN apk update && apk upgrade && \
	apk add --no-cache git
# Other packages: bash nano

ARG environment

WORKDIR /node

COPY ./node .
COPY .env ..

RUN NODE_ENV=$environment npm install

CMD NODE_ENV=$environment npm start
