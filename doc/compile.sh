#!/bin/bash

# Navigate to the paper directory relative to the script location
cd "$(dirname "$0")/paper" || { echo "Error: Directory paper not found"; exit 1; }

# Define the base filename
FILENAME="TranslitSeq2SeqAttention"

echo "=== Compilation (pdflatex + bibtex) ==="
pdflatex -interaction=nonstopmode "$FILENAME.tex"
bibtex "$FILENAME"
pdflatex -interaction=nonstopmode "$FILENAME.tex"
pdflatex -interaction=nonstopmode "$FILENAME.tex"

echo "=== Moving PDF to parent directory ==="
if [ -f "$FILENAME.pdf" ]; then
    mv "$FILENAME.pdf" ../
    echo "=== Compilation Complete ==="
    echo "PDF updated in doc/: $FILENAME.pdf"
else
    echo "=== Compilation Failed ==="
    echo "Error: PDF generation failed."
fi
