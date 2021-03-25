# docker-logstash
Docker image for logstash

# Version

**major.minor.path** version is for **logstash**.

The **build number** for **this project** release. 

# Possible
*  `docker run -d --name logstash -e ELASTICSEARCH_HOST=localhost -e ELASTICSEARCH_PORT=9200 --mount type=bind,source=/tmp/logstash.yml,target=/usr/share/logstash/config/logstash.yml --mount type=bind,source=/tmp/logstash.conf,target=/usr/share/logstash/pipeline/logstash.conf ui3o/docker-logstash:7.10.2.1`
