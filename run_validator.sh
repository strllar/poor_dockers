#!/usr/bin/env bash

XZ_FILE=~/core-built$1.tar.xz

if [[ -e $XZ_FILE ]]
then
	docker build --rm=true -t validator -f runner/Dockerfile runner/ \
		&& docker run --rm=true -ti \
				  -p=13625:13625 \
				  -p=127.0.0.1:13625:13625 \
				  -v ~/.aws:/root/.aws \
				  -v ~/.osscredentials:/root/.osscredentials \
				  -v $XZ_FILE:/core-built.tar.xz \
				  -v ~/core-run:/core-run \
				  validator run klm
else
	echo "$XZ_FILE not exist"
fi
