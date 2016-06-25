FROM debian:jessie

MAINTAINER Manala <contact@manala.io>

ENV HUGO_VERSION          0.16
ENV HUGO_VERSION_REVISION 1

WORKDIR /tmp

ADD https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}${HUGO_VERSION_REVISION:+-${HUGO_VERSION_REVISION}}_amd64.deb hugo.deb

RUN dpkg -i hugo.deb \
    && rm -rf * \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /srv
