# oracle client builder
ARG NODE_VERSION=16.14.2

FROM node:$NODE_VERSION AS builder_driver

RUN apt-get update && apt-get install -y \
  unzip

COPY /conf/oracle /opt/oracle

COPY ./install_oracle_driver.sh /opt/oracle

RUN /opt/oracle/install_oracle_driver.sh

# nodejs oracledb builder
FROM node:$NODE_VERSION AS builder_node_oracledb

RUN apt-get update && apt-get install -y jq

RUN mkdir /opt/oracle

COPY ./build_node_oracledb.sh  /opt/oracle

RUN /opt/oracle/build_node_oracledb.sh

# final stage
FROM node:$NODE_VERSION

RUN apt-get update && apt-get install -y \
  libaio1 \
  libaio-dev

RUN mkdir /opt/oracle

COPY --from=builder_driver /opt/oracle/unzip /opt/oracle

COPY --from=builder_node_oracledb /opt/node-oracledb/oracledb.tgz /opt/oracle

# Create environment variables to npm oracle dependencies
ENV OCI_LIB_DIR="/opt/oracle/instantclient"

ENV LD_LIBRARY_PATH="/opt/oracle/instantclient"

ENV OCI_INC_DIR="$OCI_LIB_DIR/sdk/include"
