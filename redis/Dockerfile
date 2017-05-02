FROM ubuntu:14.04

MAINTAINER 2tom <tera1215@gmail.com>

RUN echo "Asia/Tokyo" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

RUN apt-get update && apt-get install -y\
 git-core\
 curl\
 unzip\
 build-essential\
 libcurl4-openssl-dev\
 software-properties-common\
 bzip2\
 vim\
 && rm -rf /var/lib/apt/lists/*

ENV REDIS_VERS 3.0.6

RUN cd /tmp\
 && curl -L -O http://download.redis.io/releases/redis-$REDIS_VERS.tar.gz\
 && tar xvf redis-${REDIS_VERS}.tar.gz\
 && cd redis-${REDIS_VERS}\
 && make\
 && make install\
 && cp -f src/redis-sentinel /usr/local/bin\
 && mkdir -p /etc/redis\
 && cp -f *.conf /etc/redis\ 
 && rm -rf /tmp/redis-stable*\
 && sed -i 's/^\(bind .*\)$/# \1/' /etc/redis/redis.conf\
 && sed -i 's/^\(daemonize .*\)$/# \1/' /etc/redis/redis.conf\
 && sed -i 's/^\(dir .*\)$/# \1\ndir \/data/' /etc/redis/redis.conf\
 && sed -i 's/^\(logfile .*\)$/# \1/' /etc/redis/redis.conf


VOLUME ["/data"]
WORKDIR /data

CMD ["redis-server", "/etc/redis/redis.conf"]

EXPOSE 6379
