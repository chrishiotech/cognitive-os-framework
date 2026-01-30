#!/bin/bash
/Volumes/OSCognitive/04_LAB_AI_ENGINEERING/System_Scripts/generate_metadata.sh > /dev/null 2>&1
KNOWN=$(grep -c '"name"' "/Volumes/OSCognitive/00_CORE_SYSTEM/GEMA_Governance/SYSTEM_METADATA.json" 2>/dev/null || echo "0")
FRESH=$(grep -c '"name"' "/Volumes/OSCognitive/00_CORE_SYSTEM/GEMA_Governance/SYSTEM_METADATA_FRESH.json" 2>/dev/null || echo "0")
NEW=$((FRESH - KNOWN))
echo "🛡️  INTEGRIDAD: $KNOWN en libro mayor + $NEW nuevos detectados"
if [ $NEW -gt 0 ]; then
  echo "  💡 Los nuevos archivos están listos para ser incorporados al libro mayor"
else
  echo "  ✅ Sistema en estado conocido"
fi
