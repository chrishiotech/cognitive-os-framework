#!/bin/bash
# ssot_checksum.sh — Genera checksums para demo (versión pública segura)

MANIFEST="./demo/SSOT_CHECKSUM_MANIFEST.txt"
> "$MANIFEST"

echo "Fecha: $(date)" >> "$MANIFEST"
echo "================================================================" >> "$MANIFEST"

echo "SSOT_Identity_Demo: $(sha256sum "./demo/SSOT_Identity_Demo.md" 2>/dev/null | cut -d' ' -f1)" >> "$MANIFEST"
echo "CV_TechLead_Demo: $(sha256sum "./demo/CV_TechLead_Demo.md" 2>/dev/null | cut -d' ' -f1)" >> "$MANIFEST"

echo "✅ Checksums generados para demo" >> "$MANIFEST"
cat "$MANIFEST"
