ARG NODE_VERSION=16.14

FROM ghcr.io/shenron/node-oracle-client:$NODE_VERSION

ARG NPM_TOKEN

RUN mkdir -p /usr/src/app/ && \
    mkdir /tmp/app && \
    chown -R node:node /tmp/app && \
    chown -R node:node /usr/src/app

USER node

# Force to have the good version of NodeJS
RUN echo "engine-strict=true" > /tmp/app/.npmrc

# Install dependencies before add src to avoid install dependencies each time
COPY package.json /tmp/app/package.json

RUN cd /tmp/app && \
  sed -i '/"oracledb"/d' package.json && \
  npm i /opt/oracle/oracledb.tgz && \
  npm i && \
  mv ./node_modules/ /usr/src/app/ && \
  mv package.json /usr/src/app/

COPY . /usr/src/app/

WORKDIR /usr/src/app

CMD node index.js

EXPOSE 1337
