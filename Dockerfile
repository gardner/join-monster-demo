FROM node:boron

ENV HOME=/home/node
WORKDIR $HOME/app/

RUN mkdir -p $HOME/app/ && chown -R node:node $HOME
USER node

COPY package.json $HOME/app/
RUN npm i


CMD npm start

