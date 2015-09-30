# docker-openwrt-mysql
install mysql on openwrt

Current status:

* You can build the Dockerfile like the following if you are in the Dockerfile folder:
   docker build -t gelareh/docker-openwrt-mysql .

  An error wil occure:
  "/etc/init.d/mysqld: Error: I didn't detect a privileges table, you might need to run mysql_install_db --force to initialize the system tables"
 Although build is done successfully.
 
 * Run the docker and open the port 33070 for external connection:
  docker run -p 33070:3306 --rm -it gelareh/docker-openwrt-mysql /bin/bash


Directly after running the docker checked the mysql_error.log file which is empty as expected.
* root@497f752aed14:/# cat /var/log/mysql/mysql_error.log 
root@497f752aed14:/# 

usr/bin/mysqld --skip-grant &
* root@497f752aed14:/# usr/bin/mysqld --skip-grant &
10

* root@497f752aed14:/# cat /var/log/mysql/mysql_error.log 
150930 14:49:34 [Warning] Can't open and lock time zone table: Table 'mysql.time_zone_leap_second' doesn't exist trying to live without them
150930 14:49:34 [ERROR] Can't open and lock privilege tables: Table 'mysql.servers' doesn't exist
150930 14:49:34 [Note] usr/bin/mysqld: ready for connections.
Version: '5.1.73-log'  socket: '/var/run/mysqld.sock'  port: 3306  Source distribution
root@497f752aed14:/# 

and 
* root@497f752aed14:/# cat /var/log/mysql/mysql.log       
usr/bin/mysqld, Version: 5.1.73-log (Source distribution). started with:
Tcp port: 3306  Unix socket: /var/run/mysqld.sock
Time                 Id Command    Argument
root@497f752aed14:/# 

root@497f752aed14:/# /usr/bin/mysql -u root mysql
ERROR 1049 (42000): Unknown database 'mysql'
root@497f752aed14:/# cat /var/log/mysql/mysql_error.log 
150930 14:49:34 [Warning] Can't open and lock time zone table: Table 'mysql.time_zone_leap_second' doesn't exist trying to live without them
150930 14:49:34 [ERROR] Can't open and lock privilege tables: Table 'mysql.servers' doesn't exist
150930 14:49:34 [Note] usr/bin/mysqld: ready for connections.
Version: '5.1.73-log'  socket: '/var/run/mysqld.sock'  port: 3306  Source distribution
root@497f752aed14:/# cat /var/log/mysql/mysql.log 
usr/bin/mysqld, Version: 5.1.73-log (Source distribution). started with:
Tcp port: 3306  Unix socket: /var/run/mysqld.sock
Time                 Id Command    Argument
150930 14:51:36	    1 Connect	root@ as anonymous on mysql
root@497f752aed14:/# 

root@497f752aed14:/# /usr/bin/mysql -u root             
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 2
Server version: 5.1.73-log Source distribution

Copyright (c) 2000, 2013, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> 

root@497f752aed14:/# cat /var/log/mysql/mysql.log 
usr/bin/mysqld, Version: 5.1.73-log (Source distribution). started with:
Tcp port: 3306  Unix socket: /var/run/mysqld.sock
Time                 Id Command    Argument
150930 14:51:36	    1 Connect	root@ as anonymous on mysql
150930 14:53:08	    2 Connect	root@ as anonymous on 
		    2 Query	select @@version_comment limit 1
150930 14:53:18	    2 Quit	
root@497f752aed14:/# 

Now From Outside Docker:





