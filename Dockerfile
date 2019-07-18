FROM mysql:latest
RUN RAND="$(date +%s | rev | cut -c 1-2)$(echo ${RANDOM})" && sed -i '/\[mysqld\]/a server-id='$RAND'\nlog-bin' /etc/mysql/mysql.conf.d/mysqld.cnf
ADD docker-entrypoint.sh /usr/local/bin/custom-docker-entrypoint.sh
RUN rm -f /entrypoint.sh
RUN ln -s usr/local/bin/custom-docker-entrypoint.sh /entrypoint.sh # backwards compat
ENTRYPOINT ["custom-docker-entrypoint.sh"]
EXPOSE 3306 33060
CMD ["mysqld"]
