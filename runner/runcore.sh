#!/usr/bin/env bash

set -e

if [ "$1" = 'run' ]; then
	tar Jvfx core-built.tar.xz
	mkdir -p core-run/$2/
	echo ""
	echo "# do something before stellar-core launch"
	echo "# eg. stellar-core --newdb"
	echo "# eg. stellar-core --newhist <archive name>"
	echo "# eg. stellar-core --forcescp && stellar-core"
	echo ""
	export PATH=$PATH:/oss:/core-built/$2/bin/
	cd core-run/$2 \
		&& bash
	exec stellar-core 
else
	exec "$@"
fi

