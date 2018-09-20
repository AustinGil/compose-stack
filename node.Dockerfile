FROM node:alpine

RUN apk update && apk upgrade && \
	apk add --no-cache git
# Other packages: bash nano
