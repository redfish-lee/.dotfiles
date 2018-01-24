#!/bin/bash
for filename in $(ls)
do
  ext=${filename##*\.}
  case "$text" in
    c) echo "$filename : C source file" ;;
    o) echo "$filename : Object file" ;;
    sh) echo "$filename : Shell script" ;;
    *) echo "Other types" ;;
  esac
done