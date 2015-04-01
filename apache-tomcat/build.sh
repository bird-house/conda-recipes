#!/bin/bash

# Build dependencies:
# - java-1.7.0-openjdk-devel
# - appropriately setup JAVA_HOME variable in system

mkdir -vp ${PREFIX}/bin;
mkdir -vp ${PREFIX}/opt/apache-tomcat;

export JAVA_HOME="/usr/lib/jvm/default-java"
#export JRE_HOME="/usr/lib/jvm/jre"

mv * ${PREFIX}/opt/apache-tomcat

pushd ${PREFIX}/bin || return 1;
ln -vs ../opt/apache-tomcat/bin/catalina.sh . || return 1;
popd || return 1;

