FROM resin/armv7hf-debian-qemu

MAINTAINER Jannis Schaefer <j.schaefer@estwx.de>

RUN [ "cross-build-start" ]

RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    erlang \
    erlang-base \
    erlang-crypto \
    erlang-xmerl \
    erlang-eunit \
    erlang-inets \
    erlang-os-mon \
    erlang-public-key \
    erlang-ssl \
    erlang-syntax-tools \
    erlang-tools \
    libnspr4 \
    libstdc++6 \
    libc6 \
    libjs-jquery \
    libjs-underscore \
    libicu-dev \
    libmozjs185-dev \
    libcurl4-openssl-dev \
    git && \
    curl -J -L -o couchdb.tar.gz http://www-eu.apache.org/dist/couchdb/source/2.0.0/apache-couchdb-2.0.0.tar.gz \
    && tar -zxf couchdb.tar.gz \
    && cd apache-couchdb-* \
    && ./configure --disable-docs \
    && make release \
#    && make install \ - Gibt es nicht, stattdessen copy
    && cp -r rel/couchdb /usr/local/lib \
    && cd .. \
    && rm -rf apache-couchdb-* \
    && rm *.tar.gz \
    && apt-get purge -y \
    binutils \
    build-essential \
    cpp \
    erlang \
    erlang-dev \
    git \
    make && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Define mountable directories.
VOLUME ["/usr/local/var/lib/couchdb"]

EXPOSE 5984
WORKDIR /var/lib/couchdb

RUN [ "cross-build-end" ]

CMD [ "/usr/local/lib/couchdb/bin/couchdb"]