FROM debian:jessie

ADD https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/4.2.0/flyway-commandline-4.2.0-linux-x64.tar.gz /flyway.tar.gz

RUN mkdir -p /opt/flyway
RUN tar -xzf /flyway.tar.gz -C /opt/flyway && \
    rm /flyway.tar.gz && \
    ln -s /opt/flyway/flyway-4.2.0/flyway /usr/local/bin/flyway

VOLUME ["/sql"]

WORKDIR /
ENTRYPOINT ["flyway", "-locations=filesystem:/sql"]
CMD ["--help"]

