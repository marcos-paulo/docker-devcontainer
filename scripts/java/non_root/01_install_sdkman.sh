#!/bin/bash

curl -s "https://get.sdkman.io" | bash >/dev/null
source "/home/java/.sdkman/bin/sdkman-init.sh"
# sdk list java >versions.txt
sdk install java 17.0.4-amzn
