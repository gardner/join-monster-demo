FROM node:boron

ENV HOME=/home/node
WORKDIR $HOME/app/

COPY package.json $HOME/app/
RUN npm i

RUN chown -R node:node $HOME
USER node

CMD npm start

