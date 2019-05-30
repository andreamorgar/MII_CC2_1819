# Contenedor de origen
FROM ubuntu:latest

# Directorio de trabajo
WORKDIR /

# Copiamos el script de instalación de MySQL
COPY installation.sh ./
COPY mysql_secure_installation.sql ./

# Damos permisos al script
RUN chmod 777 installation.sh && ./installation.sh
VOLUME ["/var/lib/mysql"]

# Abrimos el puerto de MySQL
EXPOSE 3306

# https://stackoverflow.com/questions/25135897/how-to-automatically-start-a-service-when-running-a-docker-container
CMD ["mysqld_safe"]
