FROM node:lts

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ARG NODE_ENV
ENV NODE_ENV $NODE_ENV

COPY install/package.json /usr/src/app/package.json

RUN npm install --only=prod && \
    npm install nodebb-plugin-leaderboard && \ 
    npm install nodebb-plugin-ns-points && \
    npm install nodebb-plugin-ns-points && \
    npm install nodebb-plugin-ns-awards && \
    npm install nodebb-rewards-essentials && \
    npm install nodebb-plugin-rps-battle-rpg && \ 
    npm cache clean --force
    
COPY . /usr/src/app

ENV NODE_ENV=production \
    daemon=false \
    silent=false

EXPOSE 4567

CMD node ./nodebb build ;  node ./nodebb start
