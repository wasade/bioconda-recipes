#!/bin/bash
set -euo pipefail

SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# Set up python3 regardless of OS
curl -O https://repo.continuum.io/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
sudo bash Miniconda3-latest-MacOSX-x86_64.sh -b -p /anaconda
sudo chown -R $USER /anaconda
export PATH=/anaconda/bin:$PATH

git clone https://github.com/bioconda/bioconda-utils.git
(cd bioconda-utils && python setup.py install)

if [[ $TRAVIS_OS_NAME = "linux" ]]
then
    (cd bioconda-utils && python setup.py install)
else
    mkdir -p /anaconda/conda-bld/osx-64 # workaround for bug in current conda
    mkdir -p /anaconda/conda-bld/linux-64 # workaround for bug in current conda
    conda index /anaconda/conda-bld/linux-64 /anaconda/conda-bld/osx-64

    # setup bioconda channel
    conda config --add channels bioconda
    conda config --add channels r
    conda config --add channels file://anaconda/conda-bld
fi
