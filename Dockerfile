FROM ubuntu:14.04.4
MAINTAINER nickryand "nickryand@gmail.com"

RUN DEBIAN_FRONTEND=noninteractive apt-get update -y && \
    apt-get install -y python-pip python-dev libffi-dev openjdk-7-jre-headless curl software-properties-common

RUN pip install timesketch && \
    cp /usr/local/share/timesketch/timesketch.conf /etc/

RUN DEBIAN_FRONTEND=noninteractive && \
    add-apt-repository ppa:gift/stable && \
    apt-get update -y && \
    apt-get install -y python-plaso

COPY entrypoint.sh /entrypoint.sh

EXPOSE 5000

#CMD /bin/bash
ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
