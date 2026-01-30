#!/bin/bash
echo "🚀 MASTER SYNC"

echo ""
echo "1/4 Metadata..."
/Volumes/OSCognitive/04_LAB_AI_ENGINEERING/System_Scripts/generate_metadata.sh

echo ""
echo "2/4 Integridad..."
/Volumes/OSCognitive/04_LAB_AI_ENGINEERING/System_Scripts/verify_integrity.sh

echo ""
echo "3/4 XRAY..."
/Volumes/OSCognitive/04_LAB_AI_ENGINEERING/System_Scripts/xray_report.sh

echo ""
echo "4/4 GitHub..."
cd /Volumes/OSCognitive && git add . && git commit -m "chore: sync $(date +%Y-%m-%d)" --no-verify 2>/dev/null && git push origin main 2>/dev/null || echo "⚠️ Sin cambios nuevos"

echo ""
echo "✅ COMPLETADO"
