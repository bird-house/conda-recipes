mkdir build
cd build

cmake \
  -DCMAKE_INSTALL_PREFIX=$PREFIX \
  -DCMAKE_Fortran_COMPILER=gfortran \
  -DBUILD_TESTING=OFF \
  -DBUILD_SHARED_LIBS=OFF \
  -DLAPACKE=ON \
  ..

make -j${CPU_COUNT}
make install