#!/bin/bash

# Build dependencies:
# - java-1.7.0-openjdk-devel
# - appropriately setup JAVA_HOME variable in system

export JAVA_HOME="/usr/lib/jvm/default-java"

mv thredds.war ${PREFIX}/opt/apache-tomcat/webapps


