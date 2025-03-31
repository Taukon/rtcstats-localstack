# FROM node:bookworm
FROM node:22.14.0-bookworm

RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    less \
    && rm -rf /var/lib/apt/lists/*

#------------------------------------------------------------------------------
# install awscli v2
#------------------------------------------------------------------------------
RUN curl -s "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install \
    && rm -rf aws awscliv2.zip

#------------------------------------------------------------------------------
# rtcstats-server
#------------------------------------------------------------------------------
    WORKDIR /rtcstats
# WORKDIR /rtcstats/rtcstats-server