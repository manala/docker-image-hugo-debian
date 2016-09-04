FROM debian:jessie

MAINTAINER Manala <contact@manala.io>

ENV HUGO_VERSION          0.16
ENV HUGO_VERSION_REVISION 1

ENV NODE_VERSION 6

WORKDIR /tmp

# Hugo
ADD https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}${HUGO_VERSION_REVISION:+-${HUGO_VERSION_REVISION}}_amd64.deb hugo.deb
RUN dpkg -i hugo.deb
EXPOSE 1313

# Node
ADD https://deb.nodesource.com/setup_${NODE_VERSION}.x node
RUN bash node \
    && DEBIAN_FRONTEND=noninteractive apt-get --no-install-recommends -y install \
      nodejs \
      optipng \
      imagemagick \
      libjpeg-turbo-progs \
      python3-pygments

# Clean
RUN rm -rf * /var/lib/apt/lists/*

WORKDIR /srv
