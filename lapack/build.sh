mkdir build
cd build

# build static libs
cmake \
  -DCMAKE_INSTALL_PREFIX=$PREFIX \
  -DBUILD_TESTING=ON \
  -DBUILD_SHARED_LIBS=OFF \
  -DUSE_OPTIMIZED_BLAS=OFF \
  -DLAPACKE=ON \
  -DBUILD_DEPRECATED=ON \
  ..
 
make -j${CPU_COUNT}
make install

# build shared libs
cmake \
  -DCMAKE_INSTALL_PREFIX=$PREFIX \
  -DBUILD_TESTING=ON \
  -DBUILD_SHARED_LIBS=ON \
  -DUSE_OPTIMIZED_BLAS=OFF \
  -DLAPACKE=ON \
  -DBUILD_DEPRECATED=ON \
  ..
 
make -j${CPU_COUNT}
make install
