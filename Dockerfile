# Use Base Debian Buster slim image
FROM debian:bookworm-slim

# Author of this Dockerfile
MAINTAINER Marko Punnar "marko[AT]aretaja.org"

# Update and install tacacs+ sssd
RUN apt-get -qq update && \
 DEBIAN_FRONTEND=noninteractive apt-get -yqq dist-upgrade && \
 DEBIAN_FRONTEND=noninteractive apt-get -yqq install collectd-core libsnmp40 && \
 DEBIAN_FRONTEND=noninteractive apt-get -yqq autoremove && \
 apt-get -qq clean && \
 rm -rf /var/lib/apt/lists/*

# Default env variables
ENV CONFIG_PATH "/home/collectd/etc"
ENV CONFIG "${CONFIG_PATH}/client.conf"

# Start script
WORKDIR /home/collectd
RUN mkdir "bin"
RUN mkdir "etc"
ADD --chown=root:root files/start.sh bin/
RUN chmod ug+x bin/start.sh

ENTRYPOINT [ "./bin/start.sh" ]
