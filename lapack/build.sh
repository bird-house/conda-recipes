cp $RECIPE_DIR/make.inc .

make -j${CPU_COUNT} all

cp *.a $PREFIX/lib
