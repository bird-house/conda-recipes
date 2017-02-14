#!/bin/bash -eu

CC="$PREFIX/bin/gcc"
CXX="${PREFIX}/bin/g++"
LIBPATH="${PREFIX}/lib"
LDFLAGS="-Wl,-rpath ${LIBPATH}"

echo "CC=${CC}" > install_configure
echo "CXX=${CXX}" >> install_configure
echo "CFLAGS=\"-Wall\"" >> install_configure 
echo "CXXFLAGS=\"-Wall -D NC4\"" >> install_configure
echo "LIB=${LIBPATH}" >> install_configure
echo "INCLUDE=\"${PREFIX}/include\"" >> install_configure


# prepare qa home in opt/qa-dkrz
QA_HOME=${PREFIX}/opt/qa-dkrz
mkdir -vp ${QA_HOME}
cp -r ./scripts ${QA_HOME}
cp -r ./tables ${QA_HOME}
cp -r ./CF-TestSuite ${QA_HOME}
cp -r ./example ${QA_HOME}
cp -r ./src ${QA_HOME}
cp -r ./include ${QA_HOME}
cp README* ${QA_HOME}
touch ${QA_HOME}/.ignore_GitHub # avoids git update!

# run build
#export QA_PATH="$PWD"
touch .ignore_GitHub # avoids git update!
export QA_LIBS="-ludunits2 -lnetcdf -lhdf5_hl -lhdf5 -lz -luuid -lmfhdf -ldf -ljpeg -lssl -lcrypto"
./install --qa-home="$PWD" CF
./install --qa-home="$PWD" CORDEX
./install --qa-home="$PWD" CMIP5
./install --qa-home="$PWD" CMIP6

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

