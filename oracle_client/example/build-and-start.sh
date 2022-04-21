#!/bin/bash

docker build -t node-oracledb-consumer .
docker run -p 1337:1337 -v $PWD:/usr/src/app -v /usr/src/app/node_modules --rm node-oracledb-consumer
