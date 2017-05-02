#!/bin/sh

docker run\
 -d\
 --name cb01\
 -p 8091:8091\
 -p 8092:8092\
 -p 11207:11207\
 -p 11210:11210\
 -t 3tier/couchbase:303

for name in cb02 cb03 ; do
	docker run -d --name $name 3tier/couchbase:303
done
