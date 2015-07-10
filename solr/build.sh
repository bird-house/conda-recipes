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

ls ${SOLR_INSTALL}

