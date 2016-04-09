mkdir build
cd build

cmake \
  -DCMAKE_INSTALL_PREFIX=$PREFIX \
  -DBUILD_TESTING=ON \
  -DBUILD_SHARED_LIBS=ON \
  -DLAPACKE=ON \
  -DBUILD_DEPRECATED=ON \
  ..
 
make -j${CPU_COUNT}
make install
