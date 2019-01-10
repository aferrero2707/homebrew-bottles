#! /bin/bash

brew upgrade --force --build-bottle Formula/libpng.rb || exit 1
brew bottle libpng || exit 1
