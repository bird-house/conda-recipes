#!/bin/bash -eu

echo "CC=\"/usr/bin/gcc\"" > install_configure
echo "CXX=\"/usr/bin/g++\"" >> install_configure
echo "CFLAGS=\"-O2 -Wall\"" >> install_configure 
echo "CXXFLAGS=\"-O2 -Wall -D NC4\"" >> install_configure
echo "LIB=\"${PREFIX}/lib\":/lib64" >> install_configure
echo "INCLUDE=\"${PREFIX}/include\":/usr/include/uuid" >> install_configure

# run build
export QA_PATH="$PWD"
./install CF

# copy all necessary files to opt/qa-dkrz
export QA_PATH=${PREFIX}/opt/qa-dkrz
mkdir -vp ${QA_PATH}
cp -r ./bin ${QA_PATH}
cp -r ./scripts ${QA_PATH}
cp -r ./tables ${QA_PATH}

# install wrapper script in bin/ to call cfchecker
cp $RECIPE_DIR/wrapper.sh $PREFIX/bin/dkrz-cf-checker
chmod +x $PREFIX/bin 





