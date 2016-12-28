FROM debian:jessie

MAINTAINER Manala <contact@manala.io>

ENV HUGO_VERSION 0.18
ENV NODE_VERSION 7

WORKDIR /tmp

# Download and install Hugo
ADD https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}-64bit.deb hugo.deb
RUN dpkg -i hugo.deb \
    && rm hugo.deb

# Node
ADD https://deb.nodesource.com/setup_${NODE_VERSION}.x setup_node

RUN bash setup_node \
    && DEBIAN_FRONTEND=noninteractive apt-get --no-install-recommends -y install \
      ca-certificates \
      nodejs \
      optipng \
      imagemagick \
      libjpeg-turbo-progs \
      python-pygments

WORKDIR /srv

# Expose default hugo port
EXPOSE 1313

# Clean
RUN rm -rf * /var/lib/apt/lists/*
