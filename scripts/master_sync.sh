#!/bin/bash
# master_sync.sh — Orquestador de verificación (versión pública segura)
# NOTA: Este script usa RUTAS RELATIVAS. Nunca contiene rutas absolutas a tu sistema real.

echo "🚀 COGNITIVE OS SYNC"
echo ""

echo "1/4 Metadata..."
bash ./scripts/generate_metadata.sh

echo ""
echo "2/4 Integridad..."
bash ./scripts/verify_integrity.sh

echo ""
echo "3/4 XRAY..."
bash ./scripts/xray_report.sh

echo ""
echo "4/4 GitHub..."
git add . 2>/dev/null
git commit -m "chore: sync $(date +%Y-%m-%d)" --no-verify 2>/dev/null || echo "⚠️ Sin cambios nuevos"
git push origin main 2>/dev/null || echo "⚠️ Push requerido manualmente (repo privado)"

echo ""
echo "✅ COMPLETADO"
