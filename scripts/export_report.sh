#!/usr/bin/env bash
# export_report.sh — Convert Markdown report to PDF or DOCX
# Usage: bash export_report.sh <format> <input_md> <output_path>
# Formats: pdf, docx

set -euo pipefail

FORMAT="${1:?Usage: export_report.sh <pdf|docx> <input.md> <output_path>}"
INPUT="${2:?Missing input markdown file path}"
OUTPUT="${3:?Missing output file path}"

# Resolve skill base directory (parent of scripts/)
BASEDIR="$(cd "$(dirname "$0")/.." && pwd)"

# Ensure output directory exists
mkdir -p "$(dirname "$OUTPUT")"

case "$FORMAT" in
  pdf)
    if command -v pandoc &> /dev/null; then
      # Try pandoc with wkhtmltopdf or weasyprint
      if command -v wkhtmltopdf &> /dev/null; then
        pandoc "$INPUT" \
          -f markdown \
          -t html5 \
          --pdf-engine=wkhtmltopdf \
          --pdf-engine-opt="--encoding" --pdf-engine-opt="utf-8" \
          --pdf-engine-opt="--margin-top" --pdf-engine-opt="20mm" \
          --pdf-engine-opt="--margin-bottom" --pdf-engine-opt="20mm" \
          --pdf-engine-opt="--margin-left" --pdf-engine-opt="15mm" \
          --pdf-engine-opt="--margin-right" --pdf-engine-opt="15mm" \
          -V mainfont="Noto Sans CJK TC" \
          --css="${BASEDIR}/assets/report-style.css" \
          -o "$OUTPUT" 2>/dev/null && echo "PDF exported: $OUTPUT" && exit 0
      fi

      # Fallback: pandoc → HTML → manual note
      HTML_OUT="${OUTPUT%.pdf}.html"
      pandoc "$INPUT" \
        -f markdown \
        -t html5 \
        --standalone \
        --metadata title="Market Analysis Report" \
        --css="${BASEDIR}/assets/report-style.css" \
        -o "$HTML_OUT" 2>/dev/null

      if [ -f "$HTML_OUT" ]; then
        echo "PDF engine not available. HTML exported instead: $HTML_OUT"
        echo "Open in browser and print to PDF, or install wkhtmltopdf for direct PDF export."
        exit 0
      fi
    fi

    # Last resort: copy raw markdown
    cp "$INPUT" "${OUTPUT%.pdf}.md"
    echo "Neither pandoc nor wkhtmltopdf available. Raw Markdown saved: ${OUTPUT%.pdf}.md"
    echo "Install pandoc (brew install pandoc) for proper PDF export."
    ;;

  docx)
    if command -v pandoc &> /dev/null; then
      pandoc "$INPUT" \
        -f markdown \
        -t docx \
        --reference-doc="${BASEDIR}/assets/reference.docx" \
        -o "$OUTPUT" 2>/dev/null && echo "DOCX exported: $OUTPUT" && exit 0

      # Fallback without reference doc
      pandoc "$INPUT" \
        -f markdown \
        -t docx \
        -o "$OUTPUT" && echo "DOCX exported (default style): $OUTPUT" && exit 0
    fi

    cp "$INPUT" "${OUTPUT%.docx}.md"
    echo "Pandoc not available. Raw Markdown saved: ${OUTPUT%.docx}.md"
    echo "Install pandoc (brew install pandoc) for DOCX export."
    ;;

  *)
    echo "Unsupported format: $FORMAT. Use 'pdf' or 'docx'." >&2
    exit 1
    ;;
esac
