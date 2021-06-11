#!/bin/bash
files_match=true
for dir in ./datasets/20??/*/; do
   cd $dir
   echo "$dir"
   d="${dir:(-3):2}_${dir:(-13):4}"
   echo "$d"
   for f in *; do
      if [[ $f != *"$d"* ]]; then
         echo "$f MUST NOT be in $dir"
         files_match=false
      fi
      
   done;
done;
if [ "$files_match" = true ]; then
   echo "All files match their directories"
else
   echo "Fix file(s) and push again!"
   exit 1
fi
