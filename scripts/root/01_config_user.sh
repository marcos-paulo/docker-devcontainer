#!/bin/bash

# Create the user
groupadd --gid $USER_GID $USERNAME
useradd --uid $USER_UID --gid $USER_GID -m $USERNAME

chsh -s /bin/bash $USERNAME

# echo $USERNAME ALL=\(root\) NOPASSWD:ALL >/etc/sudoers.d/$USERNAME &&
#   chmod 0440 /etc/sudoers.d/$USERNAME
