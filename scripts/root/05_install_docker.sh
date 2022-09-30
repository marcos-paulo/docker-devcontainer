#!/bin/bash

# Install Docker CE CLI
apt-get update
apt-get install -y apt-transport-https ca-certificates curl gnupg2 lsb-release

curl -fsSL https://download.docker.com/linux/$(lsb_release -is | tr '[:upper:]' '[:lower:]')/gpg | apt-key add - 2>/dev/null
echo "deb [arch=$(dpkg --print-architecture)] https://download.docker.com/linux/$(lsb_release -is | tr '[:upper:]' '[:lower:]') $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list

apt-get update
apt-get install -y docker-ce-cli containerd.io docker-compose-plugin

# Install Docker Compose (não prescisa)
# export LATEST_COMPOSE_VERSION=$(curl -sSL "https://api.github.com/repos/docker/compose/releases/latest" | grep -o -P '(?<="tag_name": ").+(?=")')
# curl -sSL "https://github.com/docker/compose/releases/download/${LATEST_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
# chmod +x /usr/local/bin/docker-compose

# Add group docker
groupadd -g ${DOCKER_GID} docker

# Add group docker to user
usermod -aG docker $(id ${USER_UID} -nu)
