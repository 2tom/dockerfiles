FROM 2tom/ubuntu

MAINTAINER 2tom <tera1215@gmail.com>

ENV INFLUXDB_VERS 1.2.2

RUN curl -L -O  https://dl.influxdata.com/influxdb/releases/influxdb_${INFLUXDB_VERS}_amd64.deb
RUN dpkg -i influxdb_${INFLUXDB_VERS}_amd64.deb
RUN rm -f influxdb_${INFLUXDB_VERS}_amd64.deb

VOLUME /var/lib/influxdb

EXPOSE 8083
EXPOSE 8086
EXPOSE 8088

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

COPY influxdb.conf /etc/influxdb/influxdb.conf

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/bin/influxd"]
