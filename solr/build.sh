#!/bin/bash

if [ "$(uname)" == "Darwin" ]; then
    export JAVA_HOME=$(/usr/libexec/java_home)
    #export JRE_HOME=${JAVA_HOME}/jre
else
    export JAVA_HOME="/usr/lib/jvm/default-java"
    #export JRE_HOME="/usr/lib/jvm/java-7-openjdk-amd64/jre"
fi

SOLR_INSTALL=${PREFIX}/opt/solr

mkdir -vp ${SOLR_INSTALL};

mv * ${SOLR_INSTALL}

mkdir -vp ${PREFIX}/bin || exit 1;

pushd ${PREFIX}/bin || return 1;
ln -vs ${SOLR_INSTALL}/bin/solr . || return 1;
ln -vs ${SOLR_INSTALL}/bin/post . || return 1;
popd || return 1;

