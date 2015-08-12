#!/bin/bash
SCRIPT=$(cd ${0%/*} && echo $PWD/${0##*/})
SCRIPTPATH=`dirname ${SCRIPT}`

export QA_PATH=`cd "${SCRIPTPATH}/../opt/qa-dkrz" && pwd -P`

exec ${QA_PATH}/scripts/dkrz-cf-checker $@
