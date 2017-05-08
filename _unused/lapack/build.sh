mkdir build
cd build

# build shared libs
cmake \
  -DCMAKE_INSTALL_PREFIX=$PREFIX \
  -DCMAKE_INSTALL_LIBDIR="lib" \
  -DBUILD_TESTING=OFF \
  -DBUILD_SHARED_LIBS=ON \
  -DUSE_OPTIMIZED_BLAS=OFF \
  -DLAPACKE=ON \
  -DBUILD_DEPRECATED=ON \
  ..
 
make -j${CPU_COUNT}
make install
