FROM ubuntu:16.10

MAINTAINER 2tom <tera1215@gmail.com>

RUN echo "Asia/Tokyo" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata
RUN locale-gen en_US.UTF-8
ENV LANG en_US.utf8
ENV LC_ALL en_US.UTF-8

# common
RUN apt-get update && apt-get install -y\
 git-core\
 curl\
 unzip\
 build-essential\
 libcurl4-openssl-dev\
 software-properties-common\
 bzip2\
 wget\
 && rm -rf /var/lib/apt/lists/*

# cassandra repo
RUN echo "deb http://www.apache.org/dist/cassandra/debian 39x main" | tee -a /etc/apt/sources.list.d/cassandra.sources.list\
 && curl https://www.apache.org/dist/cassandra/KEYS | apt-key add -

# cassandra install
RUN apt-get update && apt-get install -y\
 cassandra\
 cassandra-tools\
 && rm -rf /var/lib/apt/lists/*
