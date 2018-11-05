#! /bin/bash

brew reinstall --verbose --build-bottle Formula/jpeg.rb || exit 1
brew bottle jpeg || exit 1
