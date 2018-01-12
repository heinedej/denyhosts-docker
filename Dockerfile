FROM arm32v7/debian:9-slim

MAINTAINER Heine de Jager
LABEL denyhosts_version="3.0" architecture="arm32v7"

RUN apt-get update \
 && apt-get install -y git python python-ipaddr \
 && git clone https://github.com/denyhosts/denyhosts.git /denyhosts

WORKDIR /denyhosts
RUN python setup.py install \
 && rm -r /denyhosts

COPY denyhosts.conf /etc/denyhosts.conf

COPY run.sh /run.sh
RUN chmod +x /run.sh

# ENTRYPOINT ["/run.sh"]
