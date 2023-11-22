FROM ubuntu:22.04

ARG VERSION=3.15

LABEL Description="IPerf3 image from alpine" Version=VERSION
MAINTAINER Maxmiliano Andriani <max.andriani@gmail.com>

RUN apt update; \
    apt install -y git build-essential ; \
    mkdir /tmp/iperf3; \
    git clone https://github.com/esnet/iperf.git /tmp/iperf3 ; \
    cd /tmp/iperf3; git checkout ${VERSION} ; \
    cd /tmp/iperf3; ./configure; make; make install; ldconfig;
RUN apt purge -y git build-essential ; \
    apt clean && rm -rf /var/lib/apt/lists/* ; \
    rm -Rf /tmp/iperf3* ;

EXPOSE 5201/tcp 5201/udp
CMD ["-s"]
ENTRYPOINT ["iperf3"]
