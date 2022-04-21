# oracledb consumer on arm machine

It's still not possible to install `oracledb` (without Rosetta) on M1. But it works on `arm64` on linux.
The idea of this project is to run the application with docker and be able to use devDependencies like eslint, tsc etc... on the host machine.
To achieve this, `oracledb` is mocked on the host machine.

# host install 
> npm ci

> npm run lint

# run with docker
```bash
#!/bin/bash

docker build -t node-oracledb-consumer .
docker run -p 1337:1337 -v $PWD:/usr/src/app -v /usr/src/app/node_modules --rm node-oracledb-consumer
```
