#!/bin/bash
# escudo_publico.sh — Verificación de fugas (versión pública segura)

echo "🛡️  ESCUDO PÚBLICO (DEMO)"
echo "Verificando que datos sensibles NO estén en repo público..."
echo ""

# Verificar que NO existan archivos sensibles en demo/
if find ./demo -name "*RFC*" -o -name "*telefono*" -o -name "*fiscal*" 2>/dev/null | grep -q .; then
  echo "❌ ¡ALERTA! Posible fuga detectada en ./demo/"
  exit 1
else
  echo "✅ Demo limpio: sin datos sensibles detectados"
fi

echo "✅ Verificación completada (solo para datos de demostración)"
