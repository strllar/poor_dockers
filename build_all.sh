#!/usr/bin/env bash

docker build -t builder:deps -f builder/Dockerfile.deps builder/

docker build -t builder -f builder/Dockerfile builder/

docker run -ti -v /home/coreop/core-built:/core-built -e "BRANCH=klm-1.0" builder

docker run -ti  -v /home/coreop/core-built:/core-built -e "BRANCH=master" builder

