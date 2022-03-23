FROM node:16.14.2

RUN apt-get update && apt-get install -y \
  unzip \
  libaio-dev

COPY /conf/oracle /opt/oracle

COPY ./install_oracle_driver.sh /opt/oracle

# Install oracle client dependencies
RUN sh /opt/oracle/install_oracle_driver.sh

# Create environment variables to npm oracle dependencies
ENV OCI_LIB_DIR="/opt/oracle/unzip/instantclient"

ENV LD_LIBRARY_PATH="/opt/oracle/unzip/instantclient"

ENV OCI_INC_DIR="$OCI_LIB_DIR/sdk/include"
