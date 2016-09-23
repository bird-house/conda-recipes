build castf90 with openblas::

    $ FEATRURE_NOMKL=1 conda build -c birdhouse -c conda-forge .

build castf90 with intel mkl::

    $ FEATRURE_NOMKL=0 conda build -c birdhouse -c conda-forge .

You should build conda on a minimal centos6 or use a build docker image:

https://github.com/bird-house/birdhouse-build/tree/master/docker/binstar-linux-64




