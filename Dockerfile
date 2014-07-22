FROM ubuntu:precise

MAINTAINER Alex Lynham "alex@swirrl.com"

RUN apt-get update

RUN apt-get -y install tar wget curl openjdk-7-jre-headless

RUN mkdir /opt/fuseki

ADD http://apache.mirror.anlx.net//jena/binaries/jena-fuseki-1.0.2-distribution.tar.gz /opt/fuseki/jena-fuseki-1.0.2.tar.gz

RUN tar -xvzf /opt/fuseki/jena-fuseki-1.0.2.tar.gz -C /opt/fuseki

ADD config.ttl /opt/fuseki/jena-fuseki-1.0.2/user_config.ttl

ADD run-fuseki /opt/fuseki/run-fuseki

RUN chmod +x /opt/fuseki/run-fuseki

RUN mkdir /data

VOLUME /data

EXPOSE 3030

CMD ["/opt/fuseki/run-fuseki"]