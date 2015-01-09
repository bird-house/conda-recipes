#!/bin/bash

./configure LIBS="-ludunits2" --with-python --prefix=$PREFIX \
--with-geos=$PREFIX/bin/geos-config \
--with-static-proj4=$PREFIX \
--with-hdf5=$PREFIX \
--with-netcdf=$PREFIX \
--with-xerces=$PREFIX \
--with-jpeg=$PREFIX \
--with-jasper=$PREFIX \
--without-pam \
--disable-rpath
make
make install

# Copy data files 
mkdir -p $PREFIX/share/gdal/
cp -f data/* $PREFIX/share/gdal
cp -f LICENSE.TXT $PREFIX/share/gdal

