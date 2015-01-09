#!/bin/bash

export CPPFLAGS="-I$PREFIX/include -I$PREFIX/include/libxml2 -I$PREFIX/include/cairo -I$PREFIX/include/freetype2"
export LDFLAGS="-L$PREFIX/lib/"

function clean {
  rm -f *.o
  rm -f *.a
  rm -f adagucserver
  rm -f h5ncdump
}

cd hclasses
clean
make -j4
[ -f hclasses.a ] || exit 1

cd ../CCDFDataModel
clean
clean
make -j4
[ -f CCDFDataModel.a ] || exit 1
  
cd ../adagucserverEC
clean
make -j4
[ -f adagucserver ] || exit 1

# copy executables
cp adagucserver $PREFIX/bin/
cp h5ncdump $PREFIX/bin/

# copy data files 
mkdir -p $PREFIX/share/adagucserver/
cd ../data
cp -r fonts $PREFIX/share/adagucserver/
cp -r XMLTemplates $PREFIX/share/adagucserver/

