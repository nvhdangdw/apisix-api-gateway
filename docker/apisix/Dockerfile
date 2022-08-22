FROM apache/apisix:2.14.1-alpine

RUN apk add \
    jq \
    uuidgen

COPY ./imports /imports

RUN /imports/import.sh
