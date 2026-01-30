#!/bin/bash
# xray_report.sh — Reporte técnico MINIMALISTA (versión pública segura)

REPORT="./demo/XRAY_$(date +%Y%m%d_%H%M%S).md"
> "$REPORT"

echo "# XRAY — $(date)" >> "$REPORT"
echo "" >> "$REPORT"
echo "## 🔥 Últimas 24h" >> "$REPORT"
find ./demo -type f -mtime -1 \( -name "SSOT_*.md" -o -name "CV_*.md" \) \
  | xargs stat -f "%Sm %N" -t "%H:%M" 2>/dev/null | sort | tail -5 | sed 's/^/  - /' >> "$REPORT" || echo "  ✅ Sin cambios recientes" >> "$REPORT"
echo "" >> "$REPORT"
echo "## ✅ Verificación (hashes en manifest)" >> "$REPORT"
MANIFEST="./demo/SSOT_CHECKSUM_MANIFEST.txt"
for item in "SSOT_Identity_Demo" "CV_TechLead_Demo"; do
  if grep -q "^$item:" "$MANIFEST" 2>/dev/null; then
    echo "  ✅ $item" >> "$REPORT"
  else
    echo "  ⚠️  $item (no en manifest)" >> "$REPORT"
  fi
done
echo "" >> "$REPORT"
echo "## 🚀 Pendientes" >> "$REPORT"
echo "  • Agentes Lyra/Eliad: protocolos por definir" >> "$REPORT"
echo "  • GEMA_Guardian: implementación Python pendiente" >> "$REPORT"
cat "$REPORT"
