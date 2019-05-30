UPDATE mysql.user SET authentication_string = PASSWORD('andrea') WHERE User = 'root';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
CREATE DATABASE IF NOT EXISTS owncloud;
GRANT ALL PRIVILEGES ON owncloud.* TO 'root'@'%' IDENTIFIED BY 'andrea';
FLUSH PRIVILEGES;
FLUSH HOSTS;
SET GLOBAL max_connect_errors = 100000000;
