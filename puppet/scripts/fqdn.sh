#!/bin/bash

[ -f /tmp/fqdn-escape.lock ] && exit 0

if [ -f /usr/bin/apt-get ]; then
    SO="debian"
else
    SO="redhat"
fi

FQDN=""
HOSTS=/etc/hosts
SO_VALUE=$(hostname)

read -p "Informe o FQDN[$SO_VALUE]: " FQDN
[ -z "$FQDN" ] && FQDN=$SO_VALUE

if [ $SO == "debian" ]; then
    HOSTNAME=/etc/hostname
    echo $FQDN > $HOSTNAME
    hostname -F $HOSTNAME
else
    SYSCONFIG=/etc/sysconfig/network
    echo "NETWORKING=yes"  > $SYSCONFIG
    echo "HOSTNAME=$FQDN" >> $SYSCONFIG
    hostname $FQDN
fi

ALIAS=$(echo $FQDN | cut -d. -f1)
echo "127.0.0.1 localhost.localdomain   localhost" > $HOSTS
echo "127.0.0.1 $FQDN   $ALIAS"                   >> $HOSTS

> /tmp/fqdn-escape.lock
