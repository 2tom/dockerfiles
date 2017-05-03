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

# gosu install
RUN apt-get update && apt-get install -y\
 gosu\
 && rm -rf /var/lib/apt/lists/*

ENV CASSANDRA_CONFIG /etc/cassandra

COPY docker-entrypoint.sh /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

RUN mkdir -p /var/lib/cassandra "$CASSANDRA_CONFIG"\
 && chown -R cassandra:cassandra /var/lib/cassandra "$CASSANDRA_CONFIG"\
 && chmod 777 /var/lib/cassandra "$CASSANDRA_CONFIG"

VOLUME /var/lib/cassandra

# 7000: intra-node communication
# 7001: TLS intra-node communication
# 7199: JMX
# 9042: CQL
# 9160: thrift service
EXPOSE 7000 7001 7199 9042 9160
CMD ["cassandra", "-f"]
