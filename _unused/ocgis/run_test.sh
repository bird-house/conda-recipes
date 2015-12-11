#!/bin/bash
export GDAL_DATA=${PREFIX}/share/gdal
python -c "import ocgis"
cd $SRC_DIR
python setup.py test
cd -
