# use our own conda makefile
cp $RECIPE_DIR/Makefile .

make

cp analogue.out $PREFIX/bin/analogue.out

castf90_home="$PREFIX/opt/castf90"
mkdir -p $castf90_home

cp *.sh *.pdf pbsscript $castf90_home
