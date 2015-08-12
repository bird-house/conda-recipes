#!/bin/bash -eu

echo "CC=\"/usr/bin/gcc\"" > install_configure
echo "CXX=\"/usr/bin/g++\"" >> install_configure
echo "CFLAGS=\"-O2 -Wall\"" >> install_configure 
echo "CXXFLAGS=\"-O2 -Wall -D NC4\"" >> install_configure
echo "LIB=\"$PREFIX/lib\"" >> install_configure
echo "INCLUDE=\"$PREFIX/include\"" >> install_configure

export QA_PATH="$PWD"
./install CF

export QA_PATH=$PREFIX/opt/qa-dkrz
mkdir -vp $QA_PATH
cp -r ./bin $QA_PATH
cp -r ./scripts $QA_PATH
cp -r ./tables $QA_PATH

pushd $PREFIX/bin || return 1;
ln -vs $QA_PATH/scripts/dkrz-cf-checker . || return 1;
popd || return 1;





