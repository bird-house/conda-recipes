#!/bin/bash
#

# Make sure the build can find NetCDF4 and HDF5:
export NETCDF_HOME=$PREFIX
export HDF5_HOME=$PREFIX

# Build the library:
python setup.py install
