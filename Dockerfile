FROM ubuntu:latest
MAINTAINER nickryand "nickryand@gmail.com"

RUN DEBIAN_FRONTEND=noninteractive && \
    apt-get update -y

RUN DEBIAN_FRONTEND=noninteractive && \
    apt-get install -y python-pip python-dev libffi-dev openjdk-7-jre-headless curl

RUN pip install timesketch && \
    cp /usr/local/share/timesketch/timesketch.conf /etc/

COPY entrypoint.sh /entrypoint.sh

EXPOSE 8000

CMD /bin/bash
#ENTRYPOINT ["/bin/bash", "/scripts/run.sh"]

