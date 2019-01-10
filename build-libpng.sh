#! /bin/bash

brew uninstall --force --ignore-dependencies libpng
brew install --force --build-bottle Formula/libpng.rb || exit 1
brew bottle libpng || exit 1
