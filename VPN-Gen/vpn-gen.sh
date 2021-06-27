echo "Massive VPN Client Generator for Pi-VPN"
if [ $# -eq 2 ]
then
 Nombre=$1
 Cantidad=$2
 echo "Nombre: $Nombre"
 echo "Cantidad: $Cantidad"
 for Numero in `seq 1 $Cantidad`;
 do
  echo "Generando: $Nombre$Numero"
  pivpn -a nopass -n $Nombre$Numero -d 1080
 done
else
 echo "Error, Argumentos No Detectados o Erroneos"
 echo "Ejemplo de Uso: vpn-gen NOMBRE CANTIDAD"
fi
