#!/bin/sh



cd contrib




mkdir archives && cd archives

wget --no-check-certificate -q http://build-archive.informatik.uni-tuebingen.de/openms/contrib/source_packages/seqan-mini-1.4.1.tar.gz
wget --no-check-certificate -q http://build-archive.informatik.uni-tuebingen.de/openms/contrib/source_packages/libsvm-3.12.tar.gz
#wget --no-check-certificate -q http://build-archive.informatik.uni-tuebingen.de/openms/contrib/source_packages/bzip2-1.0.5.tar.gz
#wget --no-check-certificate -q http://build-archive.informatik.uni-tuebingen.de/openms/contrib/source_packages/zlib-1.2.5.tar.gz
#wget --no-check-certificate -q http://build-archive.informatik.uni-tuebingen.de/openms/contrib/source_packages/boost_1_52_0.tar.gz
#wget --no-check-certificate -q http://build-archive.informatik.uni-tuebingen.de/openms/contrib/source_packages/xerces-c-3.1.1.tar.gz
#wget --no-check-certificate -q http://build-archive.informatik.uni-tuebingen.de/openms/contrib/source_packages/gsl-1.13.tar.gz
#wget --no-check-certificate -q http://build-archive.informatik.uni-tuebingen.de/openms/contrib/source_packages/glpk-4.46.tar.gz
wget --no-check-certificate -q http://build-archive.informatik.uni-tuebingen.de/openms/contrib/source_packages/CoinMP-1.3.3.tar.gz
#wget --no-check-certificate -q http://build-archive.informatik.uni-tuebingen.de/openms/contrib/source_packages/eigen-3.2.0.tar.gz
wget --no-check-certificate -q http://build-archive.informatik.uni-tuebingen.de/openms/contrib/source_packages/WildMagic5.tar.gz


cd ..

cmake . -DBUILD_TYPE=LIBSVM
#cmake . -DBUILD_TYPE=XERCESC
#cmake . -DBUILD_TYPE=GSL
cmake . -DBUILD_TYPE=COINOR
#cmake . -DBUILD_TYPE=BZIP2
#cmake . -DBUILD_TYPE=GLPK
#cmake . -DBUILD_TYPE=EIGEN
cmake . -DBUILD_TYPE=WILDMAGIC
cmake . -DBUILD_TYPE=SEQAN
#cmake . -DBUILD_TYPE=BOOST -DNUMBER_OF_JOBS=4
cd ..

mkdir build
cd build
ORIGIN='$ORIGIN'
export ORIGIN
LDFLAGS='-Wl,-rpath,$${ORIGIN}/../lib' cmake .. -DCMAKE_INSTALL_PREFIX=$PREFIX -DHAS_XSERVER=OFF -DENABLE_TUTORIALS=OFF -DENABLE_STYLE_TESTING=OFF -DENABLE_UNITYBUILD=OFF -DWITH_GUI=OFF -DBoost_INCLUDE_DIR=$PREFIX/include -DBoost_LIBRARY_DIRS=$PREFIX/lib -DBoost_LIBRARIES=$PREFIX/lib -DBoost_LIB_VERSION=1.57.0 -DBoost_DEBUG=ON -DBOOST_LIBRARYDIR=$PREFIX/lib/ -DBOOST_USE_STATIC=OFF -DNUMBER_OF_JOBS=4
make TOPP ##UTILS OpenMS 
make install
