FROM ubuntu:16.04

ADD config /config

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get install --no-install-recommends -y wget unzip ca-certificates && \
    wget -O /tmp/consul.zip https://releases.hashicorp.com/consul/0.6.3/consul_0.6.3_linux_amd64.zip && \
    unzip /tmp/consul.zip -d /usr/local/bin && \
    rm /tmp/consul.zip && \
    mkdir /data && \
    apt-get purge -y wget unzip && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 8300 8301 8301/udp 8302 8302/udp 8400 8500 8600 8600/udp
ENTRYPOINT ["/usr/local/bin/consul", "agent", "-config-dir=/config"]
