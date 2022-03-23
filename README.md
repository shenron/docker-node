# NodeJS image for Docker
Extends official Node with oci8 extension

# platforms
- x86_64
- arm64

# instantclient
Files are available at `/opt/oracle`. Environment variables are set with correct path.

# oracledb for arm64
The [oracledb](https://www.npmjs.com/package/oracledb) is not available for arm64. The image provide a build to be able to install manually.

```
npm i /opt/oracle/oracledb.tgz
```
