#!/bin/bash

echo "$USERNAME:$PASSWD" | chpasswd

# Create password root
# echo "root:$PASSWD" | chpasswd

# Create password user
