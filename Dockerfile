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
    git \
    sudo \
    openssh-server \
    tzdata \
    dos2unix \
    ntp

RUN mkdir -p /workspace \
    && useradd -ms /bin/bash -d /workspace nerd4ever \
    && chown -R nerd4ever:nerd4ever /workspace \
    && echo $($RANDOM | md5sum | cut -d " " -f 1) > /workspace/password.txt \
    && echo "nerd4ever:$(cat /workspace/password.txt)" | chpasswd \
    && echo 'nerd4ever ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers \
    && usermod -a -G sudo nerd4ever

RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash - \
    &&apt-get install -y nodejs
    
RUN mkdir -p /usr/local/lib/node_modules \
    && chown -R nerd4ever:nerd4ever /usr/local/lib/node_modules

COPY entrypoint.sh /entrypoint
RUN dos2unix /entrypoint \
    && chmod +x /entrypoint

USER nerd4ever

WORKDIR /workspace

EXPOSE 22

CMD ["/entrypoint", "daemon"]