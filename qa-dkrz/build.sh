#!/bin/bash -eu

echo "CC=\"/usr/bin/gcc\"" > install_configure
echo "CXX=\"/usr/bin/g++\"" >> install_configure
echo "CFLAGS=\"-g -Wall\"" >> install_configure 
echo "CXXFLAGS=\"-g -Wall -D NC4\"" >> install_configure
echo "LIB=\"${PREFIX}/lib\":/lib64" >> install_configure
echo "INCLUDE=\"${PREFIX}/include\":/usr/include/uuid" >> install_configure

# prepare qa home in opt/qa-dkrz
QA_HOME=${PREFIX}/opt/qa-dkrz
mkdir -vp ${QA_HOME}
cp -r ./scripts ${QA_HOME}
cp -r ./tables ${QA_HOME}
cp -r ./CF-TestSuite ${QA_HOME}
cp -r ./example ${QA_HOME}
cp README* ${QA_HOME}
touch ${QA_HOME}/.ignore_GitHub # avoids git update!

# run build
#export QA_PATH="$PWD"
touch .ignore_GitHub # avoids git update!
./install CF
./install CORDEX
./install CMIP5

# copy generated files to opt/qa-dkrz
cp -r ./bin ${QA_HOME}
cp ./example/templates/qa-test.task ${QA_HOME}
cp install* ${QA_HOME}
cp .install_configure ${QA_HOME}

# write git version to install.log
echo "branch=$(git branch | grep '*' | awk '{print $2}')" > ${QA_HOME}/install.log
echo "hexa=$(git log --pretty=format:'%h' -n 1)" >> ${QA_HOME}/install.log 

# install wrapper script in bin/ to call cfchecker and qa-dkrz
cp $RECIPE_DIR/cfchecker-wrapper.sh $PREFIX/bin/dkrz-cf-checker
cp $RECIPE_DIR/qa-wrapper.sh $PREFIX/bin/qa-dkrz
chmod +x $PREFIX/bin 





