# docker-openwrt-mysql
install mysql on openwrt

Current status:

* Build:
   
 `docker build -t gelareh/docker-openwrt-mysql .`

 Note: An error will occur but build is successfully done:
```  "/etc/init.d/mysqld: Error: I didn't detect a privileges table, you might need to run mysql_install_db --force to initialize the system tables"```

 
* Run the docker and open the port 33070 for external connection:
  
	`docker run -p 33070:3306 --rm -it gelareh/docker-openwrt-mysql /bin/bash`

* Start mysql in docker container:

    `root@497f752aed14:/# usr/bin/mysqld --skip-grant &`

* Due to the given error while building:

	 `mysql_install_db --force`

* Connect to mysql:

	`/usr/bin/mysql -u root`

* mysql> show databases;
``` 
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| test               |
+--------------------+
3 rows in set (0.00 sec)
``` 
