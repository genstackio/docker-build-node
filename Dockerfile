FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update -y && \
    apt install -y --no-install-recommends ca-certificates curl groff make libc-dev unzip && \
    apt clean && \
    apt autoclean && \
    apt autoremove -y && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN curl https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -o awscliv2.zip && \
    unzip awscliv2.zip && \
    ./aws/install && \
    rm -rf ./aws awscliv2.zip && \
    aws --version

RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt install -y --no-install-recommends nodejs && \
    apt clean && \
    apt autoclean && \
    apt autoremove -y && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN apt remove -y curl && \
    apt clean && \
    apt autoclean && \
    apt autoremove -y && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN npm -g install yarn
RUN mkdir -p /code

COPY ./scripts/aws-account-set.sh /usr/local/bin/aws-account-set
COPY ./scripts/aws-profile-add.sh /usr/local/bin/aws-profile-add
COPY ./scripts/npm-registry-scope.sh /usr/local/bin/npm-registry-scope
COPY ./scripts/npm-registry-identity.sh /usr/local/bin/npm-registry-identity

WORKDIR /code