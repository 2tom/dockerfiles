#!/bin/sh

tag="2tom/rundeck:2.5.2-1"
docker build -t $tag .
image_id=$(docker inspect --format="{{ .Id }}" $tag)

