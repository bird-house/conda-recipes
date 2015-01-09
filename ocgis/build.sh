#!/bin/bash

export GDAL_DATA="${PREFIX}/share/gdal"

${PYTHON} setup.py install || exit 1;
