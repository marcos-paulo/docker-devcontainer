#!/bin/bash

echo porta $1

# Add suport sudo
apt-get update
apt-get install -y sudo

apt-get install -y openssh-server

sed -i 's/#AllowTcpForwarding yes/AllowTcpForwarding yes/g' /etc/ssh/sshd_config
sed -i 's/#GatewayPorts no/GatewayPorts yes/g' /etc/ssh/sshd_config
sed -i 's|#Port 22|Include /Home/node/app/sshd_config\n#Port 22|g' /etc/ssh/sshd_config
