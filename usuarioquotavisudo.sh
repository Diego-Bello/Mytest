
#!/bin/bash
#
#Ser root para crear usuario, cuota, visudo
	if [ "`id -u`" != 0 ] ; then
	echo -e "\n"
	echo "Debe ser root para ejecutar este script"
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
	echo ">>>>>>>>DATOS INGRESADOS CORRECTAMENTE<<<<<<<<<"
	sleep 1

#
#DATOS INGRESADOS
	echo "Los datos que ingresaste son:"
	echo "**********************************"
	echo "Nombre usuario:" $nombre
	echo "Directorio home:" $directorio
	echo "Grupo del usuario:" $grupo
	echo "Shell usuario:" $shell
	echo "**********************************"
	sleep 5
#
#CREAR GRUPO
	groupadd $grupo
	echo "grupo creado"
#
#CREAR USUARIO
	useradd -d $directorio -g $grupo -s $shell $nombre
	echo ">Usuario agregado correctamente<"
	sleep 1
#
#PASSWD USUARIO
	echo -e "\n"
	echo "Escriba la contraseña para el usuario $nombre:"
	passwd $nombre
	sleep 1
	
	echo "Usuario creado"
#
#IMPLEMENTAR CUOTAS
	echo "*************************************************"
	echo ">>>>>>IMPLEMENTACION DE CUOTAS PARA USUARIO<<<<<<"
	echo "*************************************************"
	echo "Se implementara cuota para el usuario $nombre:"
	echo "¡RECUERDE aplicar el hard mayor que el soft!"
	sleep 5
	edquota -u $nombre
	sleep 1
	echo "Cuota implementada"
	echo -e "\n"
#AGREGARCOMANDOSALUSUARIOVISUDO
	echo "*******************************************************"	
	echo ">>>>>>AGREGAR COMANDOS AL USUARIO MEDIANTE VISUDO<<<<<<"
	echo "*******************************************************"
	sleep 5
	visudo -c
	sudo visudo
	sleep 1
	echo "Listo"
	echo "Hasta pronto, que tenga buen dia"
	sleep 2
