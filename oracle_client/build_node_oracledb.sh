#!/bin/bash

# aarch64 platform needs to build oracledb manually
git config --global --unset http.proxy
git config --global --unset https.proxy

cd /opt/ && \
  git clone --recursive https://github.com/oracle/node-oracledb.git && \
  cd node-oracledb/ && \
  version=`cat package.json | jq -r .version` && \
  npm i && \
  npm run buildbinary && \
  npm run buildpackage && \
  mv oracledb-"$version".tgz oracledb.tgz
