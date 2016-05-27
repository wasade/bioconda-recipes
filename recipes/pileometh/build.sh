#!/bin/bash
set -eu -o pipefail

make
cp PileOMeth $PREFIX/bin && chmod +x $PREFIX/bin/PileOMeth
