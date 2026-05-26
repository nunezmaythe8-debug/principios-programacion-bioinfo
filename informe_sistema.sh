#!/bin/bash
# Autor: Mayte Nuñez
# Descripción:
echo ""

echo -e "\e[34m======================== \e[0m"
echo -e "\e[31m Informe del sistema \e[0m"
echo -e "\e[34m======================== \e[0m"
echo "Usuario actuaL: $(whoami)"
echo ""
echo -e "\e[1;32m Fecha y hora:\e[0m \e[37m$(date)\e[0m"
echo -e "\e[1;32m Directorio actual:\e[0m \e[37m$(pwd)\e[0m"
echo ""
echo -e "--- \e[1m Uso de disco del directorio actual \e[0m ---"
du -sh .
echo ""
echo "--- Lista de archivos con detalles ---"
ls -lh

