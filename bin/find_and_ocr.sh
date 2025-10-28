#!/usr/bin/env bash
set -euo pipefail

# Run OCR on PDFs in a Spotlight search, skipping password protected files.
search_dir="${1:-$HOME/Documents}"

while IFS= read -r pdf_path; do
  [[ -z "$pdf_path" ]] && continue

  printf 'Checking: %s\n' "$pdf_path"
  # Check if the PDF is password protected or corrupt
  if ! pdfinfo "$pdf_path" >/dev/null 2>&1; then
    printf 'Skipping (pdfinfo error): %s\n' "$pdf_path" >&2
    continue
  fi

  ocrmypdf --output-type pdf --rotate-pages --rotate-pages-threshold 2.0 --deskew "$pdf_path" "$pdf_path"
done < <(mdfind 'kMDItemKind == "PDF document" && kMDItemTextContent != "*"' -onlyin "$search_dir")
