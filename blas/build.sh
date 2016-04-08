make

gfortran -O2 -c *.f
ar cr libblas.a *.o
#cp blas_*.a $PREFIX/lib/libblas.a
cp libblas.a $PREFIX/lib/

