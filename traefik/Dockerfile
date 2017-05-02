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

ENV TRAEFIK_VERSION v1.2.3
RUN cd /usr/local/bin\
 && curl -L -O https://github.com/containous/traefik/releases/download/${TRAEFIK_VERSION}/traefik\
 && chmod +x /usr/local/bin/traefik

VOLUME /cfg
VOLUME /data

EXPOSE 80
EXPOSE 8080

CMD ["/usr/local/bin/traefik", "-c", "/cfg/traefik.toml"]
