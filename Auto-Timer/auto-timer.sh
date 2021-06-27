#!/bin/bash
echo "Auto-Timer"
if [ $# -eq 2 ]
then
 while true
 do
  echo "Ejecutando Aplicación"
  $2
  echo "Esperando $1 Segundos"
  sleep $1
 done
else
 echo "Error, Argumentos No Detectados o Erroneos"
fi
