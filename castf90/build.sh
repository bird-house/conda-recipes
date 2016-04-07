# use our own conda makefile
cp $RECIPE_DIR/Makefile Makefile.conda

make PREFIX=$PREFIX -f Makefile.conda
