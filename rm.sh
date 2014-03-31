#!/bin/sh

#find all of the *.* type files in the current directory and remove them
#including this file :)
find . -maxdepth 1 -name "*.*" | xargs rm

#prune the .git directory results, or print the name
#find . -name .git -prune -o -name "*.*"
