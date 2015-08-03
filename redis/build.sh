#!/bin/bash -eu

unset ARCH  # https://github.com/redis/hiredis-rb/issues/2
make distclean
make PREFIX=$PREFIX install

