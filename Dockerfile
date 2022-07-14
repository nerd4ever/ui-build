FROM debian:11
USER root

ENV TZ=UTC
ENV NODE_OPTIONS=--max-old-space-size=8192
ARG BUILD_ENV=prod
ARG DEBIAN_FRONTEND=noninteractive
ARG APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1

RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    ant \
    nodejs \
    npm \
    git \
    sudo

RUN useradd -ms /bin/bash nerd4ever -g root -G sudo \
    && echo 'nerd4ever ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER nerd4ever
WORKDIR /home/nerd4ever

CMD ["tail", "-f", "/var/log/lastlog"]