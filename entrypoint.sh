#!/bin/bash
set -e

HOST=${ELASTICSEARCH_PORT%:*}
HOST=${HOST##*/}
PORT=${ELASTICSEARCH_PORT##*:}
SECRET=$(openssl rand -base64 32) 

sed -i -e "s#SECRET_KEY = u''#SECRET_KEY = u'${SECRET}'#" /etc/timesketch.conf
sed -i -e "s#ELASTIC_HOST = u'.*'#ELASTIC_HOST = u'${HOST}'#" /etc/timesketch.conf
sed -i -e "s#ELASTIC_PORT = .*#ELASTIC_PORT = ${PORT}#" /etc/timesketch.conf

tsctl add_user --username ${TIMESKETCH_USER:-testuser} --password ${TIMESKETCH_PASSWORD:-testpass}
