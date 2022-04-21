const oracledb = require('oracledb');

const http = require('http');

http.createServer((request, response) => {
  response.writeHead(200, {
    'Content-Type': 'text/plain',
  });

  console.log(oracledb);

  response.write('Hello, World! :)\n');

  response.end();
}).listen(1337);

console.log('run on 1337');
