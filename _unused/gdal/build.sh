#!/bin/bash

./configure LIBS="-ludunits2" --prefix=$PREFIX \
--with-geos=$PREFIX/bin/geos-config \
--with-static-proj4=$PREFIX \
--with-hdf5=$PREFIX \
--with-netcdf=$PREFIX \
--with-xerces=$PREFIX \
--with-jpeg=$PREFIX \
--with-jasper=$PREFIX \
--with-sqlite=$PREFIX \
--without-pam \
--with-python \
--disable-rpath
make -j 4
make install

# Copy data files 
mkdir -p $PREFIX/share/gdal/
cp -f data/* $PREFIX/share/gdal
cp -f LICENSE.TXT $PREFIX/share/gdal

