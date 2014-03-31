#!/bin/sh

#find all of the *.* type files in the current directory and remove them
find . -maxdepth 1 -name "*.*" | xargs rm
