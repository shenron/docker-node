FROM node:12.14

RUN apt-get update && apt-get install -y \
  unzip \
  libaio-dev

COPY /conf/oracle /opt/oracle

# Install oracle client dependencies
RUN cd /opt/oracle && \
  unzip ./instantclient-basiclite-linux.x64-19.3.0.0.0dbru.zip -d ./unzip && \
  unzip ./instantclient-sdk-linux.x64-19.3.0.0.0dbru.zip -d ./unzip && \
  rm ./instantclient-basiclite-linux.x64-19.3.0.0.0dbru.zip instantclient-sdk-linux.x64-19.3.0.0.0dbru.zip &&\
  mv ./unzip/instantclient_19_3 ./unzip/instantclient

# Create environment variables to npm oracle dependencies
ENV OCI_LIB_DIR="/opt/oracle/unzip/instantclient"

ENV LD_LIBRARY_PATH="/opt/oracle/unzip/instantclient"

ENV OCI_INC_DIR="$OCI_LIB_DIR/sdk/include"
