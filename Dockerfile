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
    npm

CMD ["tail", "-f", "/var/log/lastlog"]