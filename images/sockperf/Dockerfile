FROM ubuntu:22.04

ARG VERSION=3.10

LABEL Description="Sockperf image from ubuntu" Version=VERSION
MAINTAINER Maxmiliano Andriani <max.andriani@gmail.com>

RUN apt update; \
    apt install -y git build-essential perl make automake autoconf m4 libtool-bin g++ ; \
    mkdir /tmp/sockperf; \
    git clone https://github.com/Mellanox/sockperf.git /tmp/sockperf; \
    cd /tmp/sockperf; git checkout ${VERSION}; \
    cd /tmp/sockperf; ./autogen.sh; \
    cd /tmp/sockperf; ./configure; \
    cd /tmp/sockperf; make; make install; \
    apt purge -y git build-essential perl make automake autoconf m4 libtool-bin g++ ; \
    apt clean && rm -rf /var/lib/apt/lists/* ; \
    rm -Rf /tmp/sockperf* ;

ENTRYPOINT ["sockperf"]