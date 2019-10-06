#!/bin/bash
set -ev

sed -i "s/resourcesDirLocation \= \"..\/../resourcesDirLocation \= \"https:\/\/raw.githubusercontent.com\/Mcdouglas\/fe3h-team-builder\/master/g" ../bundle.js