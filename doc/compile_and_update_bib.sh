#!/bin/bash

# Navigate to the paper directory relative to the script location
cd "$(dirname "$0")/paper" || { echo "Error: Directory paper not found"; exit 1; }

# Define the base filename (modify if the .tex filename changes)
FILENAME="TranslitSeq2SeqAttention"

echo "=== Step 1: Initial pdflatex ==="
pdflatex -interaction=nonstopmode "$FILENAME.tex"

echo "=== Step 2: Running bibtex ==="
# Note: bibtex runs on the .aux file, path to .bib is handled inside the .aux
bibtex "$FILENAME"

echo "=== Step 3: Second pdflatex pass ==="
pdflatex -interaction=nonstopmode "$FILENAME.tex"

echo "=== Step 4: Final pdflatex pass ==="
pdflatex -interaction=nonstopmode "$FILENAME.tex"

echo "=== Step 5: Moving PDF to parent directory ==="
if [ -f "$FILENAME.pdf" ]; then
    mv "$FILENAME.pdf" ../
    echo "=== Compilation Complete ==="
    echo "PDF generated and moved to doc/: $FILENAME.pdf"
else
    echo "=== Compilation Complete ==="
    echo "Error: PDF generation failed."
fi
