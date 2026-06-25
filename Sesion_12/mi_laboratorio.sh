#!/bin/bash
# mi_laboratorio.sh
# Descripción: Genera una ficha de identificación del laboratorio
# Autor: Mayte Nuñez

echo "=========================================="
echo "     FICHA DE IDENTIFICACIÓN - LABORATORIO"
echo "=========================================="
echo ""

read -p "Nombre del laboratorio: " LABORATORIO
export LABORATORIO

read -p "Línea de investigación: " LINEA_INVES
read -p "Número de muestras: " NUM_MUESTRA
read -p "Nombre del investigador: " INVESTIGADOR

FECHA=$(date)
USUARIO=$(whoami)

echo ""
echo "=========================================="
echo "           FICHA GENERADA"
echo "=========================================="
echo "Laboratorio        : $LABORATORIO"
echo "Línea de investigación: $LINEA_INVES"
echo "Número de muestras  : $NUM_MUESTRA"
echo "Investigador        : $INVESTIGADOR"
echo "Fecha               : $FECHA"
echo "Usuario del sistema : $USUARIO"
echo "=========================================="
