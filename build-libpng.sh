#! /bin/bash

brew reinstall --verbose --build-bottle Formula/libpng.rb || exit 1
brew bottle libpng || exit 1
