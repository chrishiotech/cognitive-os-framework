#!/bin/bash
# verify_integrity.sh — Comparación libro mayor vs sistema real (versión pública segura)

# Generar metadata fresca primero
bash ./scripts/generate_metadata.sh > /dev/null 2>&1

KNOWN=$(grep -c '"name"' "./demo/SYSTEM_METADATA.json" 2>/dev/null || echo "0")
FRESH=$(grep -c '"name"' "./demo/SYSTEM_METADATA_FRESH.json" 2>/dev/null || echo "0")
NEW=$((FRESH - KNOWN 2>/dev/null || echo "0"))

echo "🛡️  INTEGRIDAD: $KNOWN en libro mayor + $NEW nuevos detectados"
if [ "$NEW" -gt 0 ] 2>/dev/null; then
  echo "  💡 Los nuevos archivos están listos para ser incorporados al libro mayor"
else
  echo "  ✅ Sistema en estado conocido"
fi
