FROM mcreations/openwrt-x64
MAINTAINER Gelareh Abooghadareh <abooghadareh@m-creations.net>

ADD image/root /
ENV MYSQL_PWD root
RUN opkg update && \
mkdir -p /mnt/data/mysql/ && \
opkg install mysql-server

# && \
# mysql_install_db --force  && \
# /etc/init.d/mysqld start  && \
# /usr/bin/mysqld --skip-grant 
# Add MySQL scripts
# ADD run.sh /run.sh
# ENV MYSQL_USER=admin \
# MYSQL_PASS=**Random** \
# Add VOLUMEs to allow backup of config and databases
# VOLUME  ["/etc/mysql", "/var/lib/mysql"]
EXPOSE 3306
CMD ["/run"]
