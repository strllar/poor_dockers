#!/usr/bin/env bash

set -e

CHOOSED_BRANCH=${BRANCH:-klm}

git clone -b ${CHOOSED_BRANCH} https://github.com/strllar/stellar-core.git

cd stellar-core && ./autogen.sh

export PATH=$PATH:/usr/lib/llvm-3.6/bin/

./configure --prefix=/core-built/${CHOOSED_BRANCH} --enable-postgres && make && make install

