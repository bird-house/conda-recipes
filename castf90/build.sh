# use our own conda makefile
cp $RECIPE_DIR/Makefile .

make PREFIX=$PREFIX all
