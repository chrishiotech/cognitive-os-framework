#!/bin/bash
# incorporate_new_files.sh — Actualiza SYSTEM_METADATA.json con archivos nuevos detectados

echo "🔄 Incorporando archivos nuevos al libro mayor..."

# Copiar SYSTEM_METADATA_FRESH.json como nuevo libro mayor
cp "/Volumes/OSCognitive/00_CORE_SYSTEM/GEMA_Governance/SYSTEM_METADATA_FRESH.json" \
   "/Volumes/OSCognitive/00_CORE_SYSTEM/GEMA_Governance/SYSTEM_METADATA.json"

# Actualizar timestamp en el JSON
sed -i '' "s/\"last_updated\": \"[^\"]*\"/\"last_updated\": \"$(date +%Y-%m-%d)\"/" \
   "/Volumes/OSCognitive/00_CORE_SYSTEM/GEMA_Governance/SYSTEM_METADATA.json"

echo "✅ Libro mayor actualizado: SYSTEM_METADATA.json"
echo "   Archivos registrados: $(grep -c '"name"' "/Volumes/OSCognitive/00_CORE_SYSTEM/GEMA_Governance/SYSTEM_METADATA.json" 2>/dev/null || echo "0")"
