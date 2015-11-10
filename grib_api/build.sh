#!/bin/bash

export CFLAGS="-O2 -fPIC"

./configure --prefix=$PREFIX \
    --enable-shared \
    --enable-python \
    --with-jasper=$PREFIX
make
make install

