#!/bin/bash

echo "Actualizamos ubuntu para poder encontrar los paquetes"
apt-get update
echo -e "\n"

echo "Instalamos MySQL"
apt-get install -y mysql-server
echo -e "\n\n"

echo "Lanzamos MySQL service"
service mysql start

echo "Configuramos MySQL con SECURE INSTALATION"
mysql -sfu root < "mysql_secure_installation.sql"
# https://stackoverflow.com/questions/30692812/mysql-user-db-does-not-have-password-columns-installing-mysql-on-osx


# Permitimos conexión remota
sed -i "s/.*bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf

echo "REINICIAR SERVICIO Y GUARDAR CAMBIOS"
service mysql restart
