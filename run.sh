#!/bin/bash
RAND="$(date +%s | rev | cut -c 1-2)$(echo ${RANDOM})" && sed -i '/\[mysqld\]/a server-id='$RAND'\nlog-bin' /etc/mysql/mysql.conf.d/mysqld.cnf
msqld
