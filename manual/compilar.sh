#!/usr/bin/env bash
# compilar.sh — Compila o Manual de Skills e Agentes em LaTeX/PDF
set -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$DIR"

echo "=== Compilando o Manual de Skills e Agentes (Passo 1/4: pdflatex) ==="
pdflatex -interaction=nonstopmode main.tex

echo "=== Gerando a Bibliografia ABNT (Passo 2/4: bibtex) ==="
bibtex main

echo "=== Resolvendo Referências Cruzadas (Passo 3/4: pdflatex) ==="
pdflatex -interaction=nonstopmode main.tex

echo "=== Finalizando o Documento PDF (Passo 4/4: pdflatex) ==="
pdflatex -interaction=nonstopmode main.tex

echo ""
echo "=== Compilação concluída com sucesso! Documento gerado: $DIR/main.pdf ==="
