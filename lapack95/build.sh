cp $RECIPE_DIR/make.inc .
 
cd SRC/
make PREFIX=$PREFIX single_double_complex_dcomplex

cp ../lapack95.a $PREFIX/lib
cp ../lapack95_modules/*.mod $PREFIX/include
