#!/bin/bash
REPORT="/Volumes/OSCognitive/00_CORE_SYSTEM/GEMA_Governance/XRAY_Reports/XRAY_$(date +%Y%m%d_%H%M%S).md"
> "$REPORT"
echo "# XRAY — $(date)" >> "$REPORT"
echo "" >> "$REPORT"
echo "## 🔥 Últimas 24h" >> "$REPORT"
find /Volumes/OSCognitive -type f -mtime -1 \( -name "SSOT_*.md" -o -name "CV_*.md" -o -name "MATRIZ_*.md" \) \
  -not -path "*/SSOT_Sensible/*" -not -path "*/Snapshots/*" \
  | xargs stat -f "%Sm %N" -t "%H:%M" 2>/dev/null | sort | tail -10 | sed 's/^/  - /' >> "$REPORT" || echo "  ✅ Sin cambios recientes" >> "$REPORT"
echo "" >> "$REPORT"
echo "## ✅ Verificación (hashes en manifest)" >> "$REPORT"
MANIFEST="/Volumes/OSCognitive/00_CORE_SYSTEM/GEMA_Governance/SSOT_CHECKSUM_MANIFEST.txt"
for item in "SSOT_Identidad_Profesional" "KETOR_Protocol" "SSOT_BUNDLE_v2" "CV_Maestro_ES" "CV_International_US_EN"; do
  if grep -q "^$item:" "$MANIFEST" 2>/dev/null; then
    echo "  ✅ $item" >> "$REPORT"
  else
    echo "  ⚠️  $item (no en manifest)" >> "$REPORT"
  fi
done
echo "" >> "$REPORT"
echo "## 🚀 Pendientes" >> "$REPORT"
echo "  • Lyra/Eliad: protocolos por definir" >> "$REPORT"
echo "  • GEMA_Guardian: implementación Python" >> "$REPORT"
echo "  • Turismo: entrevista PYME local" >> "$REPORT"
cat "$REPORT"
