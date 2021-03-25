#Base image for logstash

FROM ubuntu:latest
LABEL maintainer="ui3o <ui3o.com@gmail.com>"

EXPOSE 9200
ENV LOGSTASH_VERSION="7.10.2"
ENV DEBIAN_FRONTEND=noninteractive

### install core programs
RUN apt-get update
RUN apt-get install -y wget lsof git vim htop curl locales locales-all
### prompt fix
ENV LC_ALL="en_US.UTF-8"
ENV LANG="en_US.UTF-8"
ENV LANGUAGE="en_US.UTF-8"

### install logstash
RUN wget https://artifacts.elastic.co/downloads/logstash/logstash-$LOGSTASH_VERSION-amd64.deb
RUN apt-get install -f ./logstash-$LOGSTASH_VERSION-amd64.deb -y

## timezone set
RUN ln -sf /usr/share/zoneinfo/CET /etc/localtime
## default folder set
RUN echo "cd /root" >> ~/.bashrc

ENTRYPOINT ["/usr/share/logstash/bin/logstash -f /usr/share/logstash/pipeline/logstash.conf"]
