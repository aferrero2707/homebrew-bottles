#! /bin/bash

brew reinstall --verbose --build-bottle Formula/fftw.rb || exit 1
brew bottle fftw || exit 1
