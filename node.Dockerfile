FROM node:alpine

RUN apk update && apk upgrade && \
	apk add --no-cache git
# Other packages: bash nano

ARG environment
ARG node_src
ENV NODE_ENV=$environment

WORKDIR /node

COPY $node_src .

RUN npm install

CMD npm start
