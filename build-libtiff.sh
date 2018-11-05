#! /bin/bash

brew reinstall --verbose --build-bottle Formula/libtiff.rb || exit 1
brew bottle libtiff || exit 1
