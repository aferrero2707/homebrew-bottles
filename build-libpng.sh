#! /bin/bash

brew upgrade --force --verbose --build-bottle Formula/libpng.rb || exit 1
brew bottle libpng || exit 1
