#!/bin/bash
# Autor: Mayte Nuñez
# Descripción: Procesa secuencias FASTA humanas

VERDE="\e[32m"
AMARILLO="\e[1;33m"
CYAN="\e[36m"
RESET="\e[0m"

echo -e "${AMARILLO}=========================================${RESET}"
echo -e "${AMARILLO}     PROCESADOR DE SECUENCIAS FASTA      ${RESET}"
echo -e "${AMARILLO}=========================================${RESET}"
echo ""

cat > secuencias_humanas.fasta << 'EOF'
>seq1|Homo_sapiens|BRCA1|cromosoma_17
ATCGATCGATCGATCGATCGATCGATCGATCGATCGATCG
>seq2|Homo_sapiens|TP53|cromosoma_17
GCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTA
>seq3|Homo_sapiens|EGFR|cromosoma_7
TTACGTTACGTTACGTTACGTTACGTTACGTTACGTTACG
EOF

echo ""

echo -e "${CYAN}Número de secuencias:${RESET}"
grep -c ">" secuencias_humanas.fasta

echo ""
echo -e "${CYAN}Identificadores de secuencias:${RESET}"
grep ">" secuencias_humanas.fasta

echo ""
echo -e "${CYAN}Longitud total del archivo:${RESET}"
wc -c secuencias_humanas.fasta
