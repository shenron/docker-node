# oracledb consumer on arm machine

It's still not possible to run natively `oracledb` on M1. But it works on `arm64` under linux.
The idea of this project is to run the application witch docker and be able to use devDependencies like eslint, tsc etc... on the host machine.
To achive this, `oracledb` is mocked on the host machine.

# install 
> npm ci

# run with docker
```bash
#!/bin/bash

docker build -t node-oracledb-consumer .
docker run -p 1337:1337 -v $PWD:/usr/src/app -v /usr/src/app/node_modules --rm node-oracledb-consumer
```
