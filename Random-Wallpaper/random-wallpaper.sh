#!/bin/bash
# Variables
Carpeta="$HOME/Imágenes/Fondos"
Cliente="192.168.98.246"
Servidor="192.168.98.242"
Nombre="LAGA-Portatil"
#

# Imagen Aleatoria
Imagen_Aleatoria()
{
 Imagen=`find $Carpeta -type f | shuf -n 1`
 gsettings set org.mate.background picture-filename $Imagen
}
#

# Imagen Remota
Imagen_Remota()
{
 Imagen=`ssh $Servidor "gsettings get org.mate.background picture-filename" | sed "s/'//g"`
 if [ ! -f "$Imagen" ]
 then
  Imagen_Aleatoria
 else
  gsettings set org.mate.background picture-filename $Imagen
 fi
}
#

# Actualizar Imagen Remota
Actualizar_Remota()
{
 Respuesta=`ssh $Cliente "gsettings set org.mate.background picture-filename $Imagen"`
}
#

# Gestionar Origen de la Imagen
if [ "$HOSTNAME" = "$Nombre" ]
then
 Imagen_Aleatoria
 TempData=`ping -c 1 $Cliente | grep received | awk -F',' '{print $2}' | awk '{print $1}'`
 if [ "$TempData" != "0" ]
 then
  Actualizar_Remota
 fi
else
 TempData=`ping -c 1 $Servidor | grep received | awk -F',' '{print $2}' | awk '{print $1}'`
 if [ "$TempData" = "0" ]
 then
  Imagen_Aleatoria
 else
  Imagen_Remota
 fi
fi
#
