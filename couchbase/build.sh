#!/bin/sh

tag="2tom/couchbase:303"
docker build -t $tag .
image_id=$(docker inspect --format="{{ .Id }}" $tag)

