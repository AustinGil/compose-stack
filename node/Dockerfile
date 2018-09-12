# Latest version of Node
FROM node:carbon

# RUN apt-get update && apt-get install -qqy nano

WORKDIR /node

COPY ./node .
COPY .env ..

RUN npm install
# If you are building your code for production
# RUN npm install --only=production

CMD npm run dock:dev

