#!/bin/bash -eu

# prepare cmor tables in share/cmip6-cmor-tables
TABLES_DIR=${PREFIX}/share/cmip6-cmor-tables
mkdir -vp ${TABLES_DIR}
cp -r Tables ${TABLES_DIR}
cp README.md ${TABLES_DIR}



