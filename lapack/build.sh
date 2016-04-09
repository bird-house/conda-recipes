mkdir build
cd build

cmake \
  -DCMAKE_INSTALL_PREFIX=$PREFIX \
  -DBUILD_TESTING=ON \
  -DBUILD_SHARED_LIBS=OFF \
  -DLAPACKE=OFF \
  -DBUILD_DEPRECATED=ON \
  ..
 
make -j${CPU_COUNT}
make install
