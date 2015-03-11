FROM dockerfile/nodejs

RUN npm install -g pm2

ADD package.json /app/package.json

RUN cd /app && npm install --production

ADD . /app

RUN npm run dist

WORKDIR /app

ENV NODE_ENV production

EXPOSE 3000

CMD pm2 start --name app /app/src/index.js && pm2 logs app
