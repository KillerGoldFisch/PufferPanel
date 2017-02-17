# Base system is the LTS version of Ubuntu.
FROM   ubuntu:16.04


# Make sure we don't get notifications we can't answer during building.
ENV    DEBIAN_FRONTEND noninteractive

ENV    VIRTUAL_HOST localhost
ENV    VIRTUAL_PORT 80

ENV    ADMIN_NAME root
ENV    ADMIN_PW toor
ENV    ADMIN_EMAIL root@localhost.net


# Download and install everything from the repos.
RUN    apt-get --yes update; apt-get --yes upgrade; apt-get --yes install software-properties-common

# Java
RUN    apt-get --yes install openssl curl openjdk-8-jdk tar python lib32gcc1 lib32tinfo5 lib32z1 lib32stdc++6 \
       nginx mysql-client mysql-server php-fpm php-cli php-curl php-mysql php-mcrypt ssh expect git && \
       phpenmod mcrypt

RUN    mkdir -p /etc && cd /etc  && \
       curl -L -o pufferpanel.tar.gz https://git.io/vDz1T && \
       tar -xf pufferpanel.tar.gz && \
       rm pufferpanel.tar.gz && \
       cd pufferpanel

# Load in all of our config files.
ADD    ./scripts/start /start
ADD    ./scripts/install.exp /etc/install


# Fix all permissions
RUN    chmod +x /start
RUN    chmod +x /etc/install

# 5657 for SSH
EXPOSE 5657

# 5656 for Webserver
EXPOSE 80

# 25565 is for minecraft
EXPOSE 25565

# /start runs it.
CMD    ["/start"]