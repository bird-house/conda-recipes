# conda-recipes
Additional or customized conda recipes used by birdhouse components.

The recipes are available on Binstar (Anaconda Server):

https://anaconda.org/birdhouse

## conda build

create recipe:

build recipe:

    $ cd recipe
    $ conda build .
    $ binstar upload -u birdhouse ...

Links:
* http://conda.pydata.org/docs/build.html
* http://conda.pydata.org/docs/build_tutorials.html

## binstar build

add binstar-build:

    $ conda config --add binstar
    $ conda install binstar-build


create recipe:

build recipe with binstar:

   $ cd recipe
   $ binstar-build init    # adds .binstar.yml config file
   $ vim .binstar.yml      # edit file: package, user=birdhouse, script=conda build ., build-targets: conda
   $ binstar-build submit .

Links:
* http://docs.anaconda.org/draft/examples.html#BinstarBuild
* http://docs.anaconda.org/draft/build-config.html

