#! /bin/bash

brew reinstall --verbose --build-bottle Formula/fftw.rb --without-fortran || exit 1
brew bottle fftw || exit 1
