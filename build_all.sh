#!/usr/bin/env bash

docker build --rm=true -t builder:deps -f builder/Dockerfile.deps builder/

docker build --rm=true -t builder -f builder/Dockerfile builder/

rm -rf /home/coreop/core-built/*


docker run --rm=true -ti -v /home/coreop/core-built:/core-built builder #default is master branch

docker run --rm=true -ti  -v /home/coreop/core-built:/core-built -e "BRANCH=klm" builder

