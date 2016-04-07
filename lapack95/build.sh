cp $RECIPE_DIR/make.inc .
 
cd SRC/
make PREFIX=$PREFIX -j${CPU_COUNT} single_double_complex_dcomplex
