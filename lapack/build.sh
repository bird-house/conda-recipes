cp $RECIPE_DIR/make.inc .

# install blas
cd BLAS/SRC

gfortran -O2 -c *.f
ar cr libblas.a *.o
cp libblas.a $PREFIX/lib

cd ..
cd ..

# install lapack libraries
make all

cp *.a $PREFIX/lib
