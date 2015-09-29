#!/usr/bin/env bash

docker build --rm=true -t validator -f runner/Dockerfile runner/ \
	&& docker run --rm=true -ti \
			  -p=13625:13625 \
			  -v ~/.aws:/root/.aws \
			  -v ~/.osscredentials:/root/.osscredentials \
			  -v ~/core-built.tar.xz:/core-built.tar.xz \
			  -v ~/core-run:/core-run \
			  validator run klm
