#!/bin/bash

#echo '----------------------------------------------------------'
#pwd
#echo "Builiding, Prefix:" + $PREFIX
#echo "$INCLUDE_PATH:" $INCLUDE_PATH
#ls

#export SHELL=/bin/bash

#export LIBCURL_CFLAGS=-I$PREFIX/include
#export INCLUDE_PATH=$PREFIX/include
#export CFLAGS="-I$PREFIX/include"
#export CPPFLAGS="-I$PREFIX/include"
#export LD_LIBRARY_PATH=$SYS_PREFIX/lib
#export LDFLAGS="-L$SYS_PREFIX/lib"
#export CPPFLAGS="-I$PREFIX/include"

#printenv
#sed -i 's/\/bin\/sh/\/bin\/bash/g' ./libtool ./missing ./config.status ./ltmain.sh ./config.sub ./Makefile ./install-sh ./config.guess ./configure ./aclocal.m4 ./depcomp ./config.log  

bash configure \
    --prefix=$PREFIX

sed -i 's/\/bin\/sh/\/bin\/bash/g' Makefile

make
make install
