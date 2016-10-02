RPi/ARM Port of YADC
===

Yet Another Port of a Dockerized CouchDB.
Put the couch in a docker container and ship it anywhere.

## Available tags

- `latest`, `2.0.0`: CouchDB 2.0 single node


## Features

* built on top of `resin/armv7hf-debian-qemu` base image
* exposes CouchDB on port `5984` of the container
* runs everything as user `couchdb` (security ftw!)
* docker volume for data

For more information visit [klaemo/docker-couchdb](https://github.com/klaemo/docker-couchdb)