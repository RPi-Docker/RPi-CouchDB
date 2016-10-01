FROM resin/armv7hf-debian-qemu

MAINTAINER Jannis Schaefer <j.schaefer@estwx.de>

RUN [ "cross-build-start" ]

RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    erlang \
    libicu-dev \
    libmozjs185-dev \
    libcurl4-openssl-dev \
    wget

RUN wget -nv https://github.com/apache/couchdb/archive/2.0.0.tar.gz \
    && tar -zxf 2.0.0.tar.gz \
    && cd couchdb-* \
    && ./configure \
    && make release \
    && make install \
    && cd .. \
    && rm -rf couchdb-* \
    && rm *.tar.gz

# Define mountable directories.
VOLUME ["/usr/local/var/lib/couchdb"]

EXPOSE 5984
WORKDIR /var/lib/couchdb

RUN [ "cross-build-end" ]