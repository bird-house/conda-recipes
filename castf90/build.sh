#!/bin/bash

echo "NOMKL: $NOMKL"
#$PREFIX/bin/mkl-version --check

make -f Makefile.conda install NOMKL=$NOMKL
