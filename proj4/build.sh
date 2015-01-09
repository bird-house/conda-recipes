#!/bin/sh

./configure --prefix=$PREFIX --without-jni

make
make install
