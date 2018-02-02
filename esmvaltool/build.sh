#!/bin/bash

export ESMVALTOOL_HOME="${PREFIX}/opt/esmvaltool"

mkdir -vp ${ESMVALTOOL_HOME}
cp -ar * ${ESMVALTOOL_HOME}

rm ${ESMVALTOOL_HOME}/conda_build.sh

# workaround for interface_data bug
# https://github.com/ESMValGroup/ESMValTool/issues/3
# chmod 777 ${ESMVALTOOL_HOME}/interface_data
