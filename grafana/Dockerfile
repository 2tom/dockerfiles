FROM 2tom/ubuntu

MAINTAINER 2tom <tera1215@gmail.com>

ENV DOWNLOAD_URL https://s3-us-west-2.amazonaws.com/grafana-releases/master/grafana_latest_amd64.deb

RUN apt-get update && apt-get install -y --no-install-recommends\
 libfontconfig\
 ca-certificates\
 && rm -rf /var/lib/apt/lists/*

RUN curl ${DOWNLOAD_URL} > /tmp/grafana.deb\
 && dpkg -i /tmp/grafana.deb\
 && rm /tmp/grafana.deb

RUN curl -L https://github.com/tianon/gosu/releases/download/1.7/gosu-amd64 > /usr/sbin/gosu\
 && chmod +x /usr/sbin/gosu

VOLUME ["/var/lib/grafana", "/var/log/grafana", "/etc/grafana"]

EXPOSE 3000

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
