# Latest version of Node
FROM node:carbon

# RUN apt-get update && apt-get install -qqy nano

ARG node_env
ENV NODE_ENV $node_env

WORKDIR /node

COPY ./node .
COPY .env ..

RUN npm install
# If you are building your code for production
# RUN npm install --only=production

CMD npm start

