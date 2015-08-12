#!/bin/bash -eu

echo "CC=\"/usr/bin/gcc\"" > install_configure
echo "CXX=\"/usr/bin/g++\"" >> install_configure
echo "CFLAGS=\"-O2 -Wall\"" >> install_configure 
echo "CXXFLAGS=\"-O2 -Wall -D NC4\"" >> install_configure
echo "LIB=\"$PREFIX/lib\"" >> install_configure
echo "INCLUDE=\"$PREFIX/include\"" >> install_configure

export QA_PATH="$PWD"
./install CF

cp -r ./bin $PREFIX
cp ./scripts/dkrz-cf-checker $PREFIX/bin
cp -r ./tables $PREFIX





