#!/bin/bash
# configurador_path.sh
# Descripción: Configura el entorno PATH para una herramienta bioinformática
# Autor: Mayte Nuñez
# Uso: bash configurador_path.sh blast

if [ $# -eq 0 ]
then
    echo " Falta el argumento"
    echo "   Uso: bash $0 <nombre_herramienta>"
    exit 1
fi

HERRAMIENTA=$1

mkdir -p ~/biotools/$HERRAMIENTA/bin

if [ $? -eq 0 ]
then
    echo " Directorio creado correctamente: ~/biotools/$HERRAMIENTA/bin"
else
    echo " Error al crear el directorio"
    exit 1
fi

export PATH=$PATH:~/biotools/$HERRAMIENTA/bin

echo "export PATH=\$PATH:~/biotools/$HERRAMIENTA/bin" >> ~/.bashrc_biotools

if [ $? -eq 0 ]
then
    echo " Configuración guardada en ~/.bashrc_biotools"
else
    echo " Error al guardar la configuración"
fi

echo ""
echo "🔧 Herramienta configurada: $HERRAMIENTA"
echo "📂 Ruta agregada al PATH  : ~/biotools/$HERRAMIENTA/bin"
