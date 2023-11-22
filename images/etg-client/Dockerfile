FROM ubuntu:22.04 as base

ARG VERSION=1.0.0

LABEL Description="Empirical Traffic Gen (client) image from alpine" Version=VERSION
MAINTAINER Maxmiliano Andriani <max.andriani@gmail.com>

# RUN apt update; \
#     apt install -y libstdc++ ; \

FROM base as build

RUN apt update; \
    apt install -y git build-essential ; \
    mkdir /tmp/etg; \
    git clone https://github.com/datacenter/empirical-traffic-gen.git /tmp/etg; \
    cd /tmp/etg; git checkout master; \
    cd /tmp/etg; make;

FROM base as app

RUN apt clean && rm -rf /var/lib/apt/lists/* ;

COPY --from=build /tmp/etg/bin/client /usr/bin/etg-client
COPY PRV2_1_CDF /root/PRV2_1_CDF

ENTRYPOINT ["etg-client"]