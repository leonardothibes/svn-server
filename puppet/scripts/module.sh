#!/bin/bash

MODDIR=/etc/puppet/modules
MODULE=$(echo $1 | cut -d- -f2)

[ -d $MODDIR ]               || mkdir -p $MODDIR
[ -d "${MODDIR}/${MODULE}" ] || puppet module install $1
