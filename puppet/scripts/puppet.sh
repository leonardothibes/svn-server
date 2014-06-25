#!/bin/bash

if [ -f /usr/bin/apt-get ]; then
    # Instalando o Puppet em Debian/Ubuntu.
    if [ ! -f /usr/bin/puppet ]; then
            apt-get install -y puppet
    fi  
    # Instalando o Puppet em Debian/Ubuntu.
else
    # Instalando o Puppet em RedHat/CentOS.
    rpm -Uvh http://yum.puppetlabs.com/el/6/products/x86_64/puppetlabs-release-6-6.noarch.rpm
    yum -y install puppet
    # Instalando o Puppet em RedHat/CentOS.
fi
