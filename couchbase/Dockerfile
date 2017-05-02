FROM ubuntu:14.04

MAINTAINER 2tom <tera1215@gmail.com>

# TZ set
RUN echo "Asia/Tokyo" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

# common pkg
RUN apt-get update && apt-get install -y\
 wget\
 curl\
 libcurl4-openssl-dev\
 && rm -rf /var/lib/apt/lists/*

# Install gosu for startup script
RUN gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 \
    && curl -o /usr/local/bin/gosu -sSL "https://github.com/tianon/gosu/releases/download/1.4/gosu-amd64" \
    && curl -o /usr/local/bin/gosu.asc -sSL "https://github.com/tianon/gosu/releases/download/1.4/gosu-amd64.asc" \
    && gpg --verify /usr/local/bin/gosu.asc \
    && rm /usr/local/bin/gosu.asc \
    && chmod +x /usr/local/bin/gosu

# Couchbase Version
ENV CB_VERSION=3.0.3 \
    CB_RELEASE_URL=http://packages.couchbase.com/releases \
    CB_PACKAGE=couchbase-server-enterprise_3.0.3-ubuntu12.04_amd64.deb \
    PATH=$PATH:/opt/couchbase/bin:/opt/couchbase/bin/tools:/opt/couchbase/bin/install

# Install couchbase
RUN curl -O  $CB_RELEASE_URL/$CB_VERSION/$CB_PACKAGE\
 && dpkg -i $CB_PACKAGE\
 && rm $CB_PACKAGE

COPY scripts/couchbase-start /usr/local/bin/
RUN chmod +x /usr/local/bin/couchbase-start
ENTRYPOINT ["couchbase-start"]
CMD ["couchbase-server", "--", "-noinput"]

EXPOSE 8091 8092 11207 11210 11211 18091 18092
VOLUME /opt/couchbase/var
