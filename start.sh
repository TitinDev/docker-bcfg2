#!/bin/bash


if [ ! -f /etc/ssl/bcfg2.pkey ]; then

    export DB_PASSWORD=`pwgen -Bs1 12` && \
    export HOSTNAME=`hostname` && \
    sed -i "s|DBPASS|${DB_PASSWORD}|" /etc/bcfg2/bcfg2.conf
    openssl genrsa -out /etc/ssl/bcfg2.pkey 2048  && \
    openssl pkey -in /etc/ssl/bcfg2.pkey -out /etc/ssl/bcfg2.key  && \
    chmod 400 /etc/ssl/bcfg2.pkey /etc/ssl/bcfg2.key  && \
    openssl req -new -key /etc/ssl/bcfg2.key -out /etc/ssl/bcfg2.csr -subj "/C=FR/ST=FRANCE/L=Springfield/O=BCFG/OU=BCFG/CN=${HOSTNAME}/emailAddress=root@root" && \
    openssl x509 -in /etc/ssl/bcfg2.csr -out /etc/ssl/bcfg2.crt -signkey /etc/ssl/bcfg2.key -req -days 365  && \
    chmod 644 /etc/ssl/bcfg2.crt  && \
    bcfg2-lint

fi


# Start supervisord and services
exec /usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf
