
#!/bin/bash
#
#Ser root para crear usuario y quotas
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
	echo "Ingresa el shell a utilizar (por defecto /bin/bash):"
	read shell
	echo ">>DATOS INGRESADOS CORRECTAMENTE<<"
	sleep 1
	echo -e "\n"
	
#
#DATOS INGRESADOS
	echo "Los datos que ingresaste son los siguientes:"
	echo "*********************************************"
	echo "Nombre usuario:" $nombre
	echo "Directorio home:" $directorio
	echo "Grupo del usuario:" $grupo
	echo "Shell usuario:" $shell
	echo "********************************************"
	sleep 4
#
#CREAR GRUPO
	groupadd $grupo
	echo "Grupo creado"
#
#CREARUSUARIO
	useradd -d $directorio -g $grupo -s $shell $nombre
	sleep 1
#
#PASSWD USUARIO
	echo -e "\n"
	echo "Escribe la contraseña para el usuario $nombre:"
	passwd $nombre
	sleep 1
	echo "Usuario creado correctamete"
	sleep 1
	echo -e "\n"
#
#IMPLEMENTAR CUOTAS USUARIO
	echo "*********************************************"
	echo ">>>>>>>>>>IMPLEMENTACION DE CUOTA<<<<<<<<<<<<"
	echo "Se implementara cuota para el usuario $nombre:"
	echo "¡Recuerde aplicar el hard mayor que el soft!"
	sleep 5
	edquota -u $nombre
	echo "Cuota implementada"
	sleep 2
	echo -e "\n"
#

#PERIODO DE GRACIA
#	echo ">>>>>>>>>>>>>PERIODO DE GRACIA<<<<<<<<<<<<<<"
#	echo "0). Modificar periodo de gracia"
#	echo "1). Salir"
#	for NUM in 0 1
#	 do
#	  case $NUM in
#		0) echo "\$NUM Modificar";;
#			edquota -t
#		1) echo "\$NUM Salir";;
#	  esac
#	 done
#
	echo "Hasta pronto, que tenga buen día"; whoami ;
	sleep 2
