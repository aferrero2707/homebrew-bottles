#! /bin/bash

BASE_URL="https://github.com/aferrero2707/homebrew-bottles/releases/download/continuous"
BOTTLES="jpeg--9c.high_sierra.bottle.1.tar.gz libpng--1.6.35.high_sierra.bottle.1.tar.gz libtiff--4.0.9_4.high_sierra.bottle.1.tar.gz fftw--3.3.8.high_sierra.bottle.1.tar.gz ilmbase--2.2.1.high_sierra.bottle.1.tar.gz openexr--2.2.0_1.high_sierra.bottle.1.tar.gz"

for B in $BOTTLES; do
  wget ${BASE_URL}/$B || exit 1
  brew reinstall -f $B || exit 1
done
