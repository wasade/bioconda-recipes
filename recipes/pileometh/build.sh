#!/bin/bash
set -eu -o pipefail

make OPTS="-Wall -g -O3 -I$PREFIX/include -L$PREFIX/lib"
cp PileOMeth $PREFIX/bin && chmod +x $PREFIX/bin/PileOMeth
