#! /bin/bash

brew reinstall --verbose --build-bottle Formula/ilmbase.rb || exit 1
brew bottle ilmbase || exit 1
brew reinstall --verbose --build-bottle Formula/openexr.rb || exit 1
brew bottle openexr || exit 1
