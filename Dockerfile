FROM debian:jessie
MAINTAINER Simone Deponti <simone.deponti@abstract.it>

ENV DEBIAN_FRONTEND noninteractive

# Install needed files
RUN \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git libpq-dev zlib1g-dev python-dev libgif-dev libjpeg-dev libtiff-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Add webapp user
RUN \
    useradd -u 1000 --home-dir=/srv/webapp --shell=/usr/sbin/nologin webapp && \
    mkdir /srv/webapp

WORKDIR /srv/webapp

RUN chown webapp:webapp /srv/webapp && \
    chmod ugo+rX /srv/webapp
