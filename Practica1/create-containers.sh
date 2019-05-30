#!/bin/bash

echo "Creando grupo de recursos..."
az group create --location westeurope --name myResourceGroup

echo "\n\n Creando contenedor para el servicio de Owncloud..."
az container create --resource-group myResourceGroup --name cowncloud --image owncloud:latest --ip-address public --ports 80

echo "\n\n Creando contenedor para el servicio de MySQL..."
az container create --resource-group myResourceGroup --name cmysql --image andreamorgar/mysql-owncloud --ip-address public --ports 3306

echo "\n\n Creando contenedor  para el servicio de LDAP..."
mv_ip=$(az container create --resource-group myResourceGroup --name cldap --image larrycai/openldap --ip-address public --ports 389 | jq -r '.ipAddress' | jq -r '.ip')

echo "\n\n Añadiendo usuarios a LDAP..."
echo $mv_ip

ldapadd -H ldap://$mv_ip -x -D "cn=admin,dc=openstack,dc=org" -w password -c -f userAndrea2.ldif

echo "\n\nFinalizado"
