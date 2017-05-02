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
 openssh-client\
 && rm -rf /var/lib/apt/lists/*

ENV RUNDECK_VERSION 2.5.2-1
ENV RUNDECK_URL http://localhost:4440

# rundeck install and settings
RUN apt-get update && apt-get install -y\
 openjdk-7-jdk\
 && rm -rf /var/lib/apt/lists/*

RUN wget -O /tmp/rundeck.deb http://dl.bintray.com/rundeck/rundeck-deb/rundeck-${RUNDECK_VERSION}-GA.deb
RUN dpkg --install /tmp/rundeck.deb\
 && rm -f /tmp/rundeck.deb\
 && chown rundeck:rundeck /tmp/rundeck\
 && sed -i 's,grails.serverURL\=.*,grails.serverURL\='${SERVER_URL}',g' /etc/rundeck/rundeck-config.properties

# This port is used in rundeck.
EXPOSE 4440 4443

# rundeck start
CMD /etc/init.d/rundeckd start;\
 tail -f /var/log/rundeck/service.log

VOLUME  ["/etc/rundeck", "/var/rundeck", "/var/lib/rundeck", "/var/lib/mysql"]
