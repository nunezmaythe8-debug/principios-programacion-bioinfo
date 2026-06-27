#!/bin/bash
# calculadora_cobertura.sh
# Calcula la cobertura estimada de secuenciación a partir de un archivo FASTA
# Autor: Mayte Nuñez | Fecha: 2026-06-26
# Uso: bash calculadora_cobertura.sh <archivo.fasta> <tamaño_genoma_Mb>
# Ejemplo: bash calculadora_cobertura.sh ecoli.fasta 4

# ══════════════════════════════════════════
#           VALIDAR ARGUMENTOS
# ══════════════════════════════════════════
if [ $# -lt 2 ]; then
    echo ""
    echo "❌ ERROR: Faltan argumentos."
    echo "   Uso: bash $0 <archivo.fasta> <tamaño_genoma_Mb>"
    echo "   Ejemplo: bash $0 ecoli.fasta 4"
    echo ""
    exit 1
fi

ARCHIVO="$1"
GENOMA_MB="$2"

# ══════════════════════════════════════════
#            VALIDAR ARCHIVO
# ══════════════════════════════════════════
if [ ! -f "$ARCHIVO" ]; then
    echo "❌ ERROR: El archivo '$ARCHIVO' no existe."
    exit 1
fi

if [ ! -s "$ARCHIVO" ]; then
    echo "❌ ERROR: El archivo '$ARCHIVO' está vacío."
    exit 1
fi

# ══════════════════════════════════════════
#                 ANÁLISIS
# ══════════════════════════════════════════
NUM_SEQS=$(grep -c "^>" "$ARCHIVO")

if [ $? -ne 0 ] || [ "$NUM_SEQS" -eq 0 ]; then
    echo "❌ ERROR: El archivo no parece tener formato FASTA válido."
    exit 1
fi

BASES_TOTALES=$(grep -v "^>" "$ARCHIVO" | tr -d '\n' | wc -c)
GENOMA_BP=$(( GENOMA_MB * 1000000 ))
COBERTURA=$(( BASES_TOTALES / GENOMA_BP ))
LONGITUD_PROMEDIO=$(( BASES_TOTALES / NUM_SEQS ))

# ══════════════════════════════════════════
#              MOSTRAR RESULTADOS
# ══════════════════════════════════════════
echo ""
echo "╔══════════════════════════════════════════╗"
echo "║      CALCULADORA DE COBERTURA FASTA      ║"
echo "╚══════════════════════════════════════════╝"
echo ""
echo "📄 Archivo analizado  : $ARCHIVO"
echo "🧬 Genoma de referencia: ${GENOMA_MB} Mb (${GENOMA_BP} bp)"
echo ""
echo "📊 ESTADÍSTICAS"
echo "─────────────────────────────────────────"
echo "  Número de secuencias : $NUM_SEQS"
echo "  Bases totales        : $BASES_TOTALES bp"
echo "  Longitud promedio    : $LONGITUD_PROMEDIO bp/secuencia"
echo "  Cobertura estimada   : ${COBERTURA}x"
echo ""

# ══════════════════════════════════════════
#             EVALUAR COBERTURA
# ══════════════════════════════════════════
COBERTURA_MIN=30

if [ $COBERTURA -ge $COBERTURA_MIN ]; then
    echo "✅ Cobertura SUFICIENTE para análisis de variantes."
else
    echo "⚠️  Cobertura INSUFICIENTE. Mínimo requerido: ${COBERTURA_MIN}x"
    echo "   Considera secuenciar más lecturas."
fi

echo ""
exit 0
