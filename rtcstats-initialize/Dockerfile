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
# rtcstats-initialize
#------------------------------------------------------------------------------

ENV app rtcstats-initialize

WORKDIR /$app

# Use cached node_modules in case package.json doesn't change.
# The npm install command needs to run before the app files are
# copied otherwise anytime an app file is changed it will invalidate
# the npm install command cache.
COPY --chown=$app:$app package.json package-lock.json /$app/

RUN npm install

COPY --chown=$app:$app . /$app

ENTRYPOINT [ "npm", "run"]

CMD [ "start" ]