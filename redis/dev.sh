#!/bin/sh

image="2tom/redis:3.0.6"
docker run\
 -d\
 --name redis01\
 -p 6379:6379\
 -t $image
