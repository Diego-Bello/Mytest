#!/bin/bash
#
#debe ser root para crear usuarios
	if [ "`id -u`" != 0 ] ; then
	echo -e "\n"
	echo "Debe ser root para ejecutar el proceso"
	exit 1
	fi
#
	echo "Bienvenido"; whoami ;
	echo "¿Cual es el nombre del usuario?:"
	read nombre
	echo "¿Cual es el directorio home? (por defecto /home/$nombre):"
	read directorio
	echo "¿Cual es el grupo del usuario?:"
	read grupo
	echo "¿Cual sera el shell a utilizar? (por defecto /bin/bash):"
	read shell
	echo "Datos ingresados correctamente"
	sleep 1
#DATOS INGRESADOS	
	echo "Los datos que ingreso son:"
	echo "********************************************"
	echo	"Nombre usuario:" $nombre
	echo	"Directorio home:" $directorio
	echo	"Grupo del usuario:" $grupo
	echo	"Shell del usuario:" $shell
	echo "********************************************"
	sleep 3
#
#CREAR GRUPO
	groupadd $grupo
	echo "Grupo del usuario creado"
#
#CREAR USUARIO
	useradd -d $directorio -g $grupo -s $shell $nombre
#
#CONTRASEÑA DEL USUARIO
	echo -e "\n"
	echo "Escribe la contraseña para el usuario $nombre:"
	passwd $nombre
	
	sleep 1
	echo "Usuario creado correctamente, hasta pronto"; whoami ;
	sleep 1

