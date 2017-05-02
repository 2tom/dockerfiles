#!/bin/bash

if [ $# -ne 1 ];then
  echo "usage: $0 [dir]"
  exit 1
fi

dir=$(pwd)/$1

docker run\
 --rm\
 -p 4000:4000\
 -p 35729:35729\
 -v $dir:/gitbook\
 -it 2tom/gitbook\
 /bin/bash
