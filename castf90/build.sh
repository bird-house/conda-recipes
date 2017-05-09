#!/bin/bash

#$PREFIX/bin/mkl-version --check

# build with intel mkl
make -f Makefile.conda install NOMKL=0
