#!/bin/bash

# Navigate to the paper directory relative to the script location
PAPER_DIR="$(dirname "$0")/paper"

if [ -d "$PAPER_DIR" ]; then
    echo "Cleaning LaTeX artifacts in $PAPER_DIR..."
    cd "$PAPER_DIR" || exit 1
    # Remove standard LaTeX intermediate files
    rm -f *.aux *.log *.out *.toc *.lof *.lot *.bbl *.blg *.fls *.fdb_latexmk *.synctex.gz
    echo "Cleanup complete."
else
    echo "Error: Directory $PAPER_DIR not found."
    exit 1
fi
