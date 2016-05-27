#!/bin/bash
set -eu -o pipefail

export CFLAGS="-I$PREFIX/include"
export LDFLAGS="-L$PREFIX/lib"
make -C htslib
make OPTS="-Wall -g -O3 -I$PREFIX/include -L$PREFIX/lib"
cp PileOMeth $PREFIX/bin && chmod +x $PREFIX/bin/PileOMeth
