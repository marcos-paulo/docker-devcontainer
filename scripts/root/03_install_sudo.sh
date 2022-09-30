#!/bin/bash
source /scripts/envs/envs.sh
# Add suport sudo

apt-get update
apt-get install -y sudo

# $(id 1000 -nu) - provide username with id 1000 / fornece o nome do usuario com id 1000

# Add sudo group to user
usermod -aG sudo $(id ${USER_UID} -nu)
