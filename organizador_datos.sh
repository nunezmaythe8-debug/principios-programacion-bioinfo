#!/bin/bash
# Autor: Mayte Nuñez
# Descripción: Organiza proyecto de genómica humana

VERDE="\e[32m"
AMARILLO="\e[1;33m"
CYAN="\e[36m"
RESET="\e[0m"

PROYECTO="proyecto_genomica_humana"

echo -e "${AMARILLO}=========================================${RESET}"
echo -e "${AMARILLO}    ORGANIZADOR DE PROYECTO GENÓMICA     ${RESET}"
echo -e "${AMARILLO}=========================================${RESET}"
echo ""
echo -e "${CYAN}Creando estructura:${RESET} $PROYECTO"
echo ""

mkdir -p $PROYECTO/{datos_raw,datos_procesados,resultados,scripts,logs,referencias}

# Archivos simulados en datos_raw
echo "@paciente_02
ATATATAGCGTATACTCT
+
IIIIIIIIIIIIIIIIII" > $PROYECTO/datos_raw/paciente_01.txt
echo "@paciente_02
ATATATATATAGCGTAGA
+
IIIIIIIIIIIIIIIIII" > $PROYECTO/datos_raw/paciente_02.txt

# Archivo en referencias
echo "Referencia: GRCh38 - Genoma humano de referencia versión 38" > $PROYECTO/referencias/genoma_ref.txt

# Log automático
echo "$(date) - Proyecto creado por $(whoami)" > $PROYECTO/logs/historial.log

echo -e "${VERDE} Estructura creada exitosamente${RESET}"
echo ""
echo -e "${CYAN}--- Estructura de carpetas ---${RESET}"
find $PROYECTO -type d | sort
echo ""
echo -e "${CYAN}--- Archivos creados ---${RESET}"
find $PROYECTO -type f | sort
echo -e "${CYAN}--- Estructura visual del proyecto ---${RESET}"
tree $PROYECTO
