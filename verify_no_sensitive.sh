#!/bin/bash
# verify_no_sensitive.sh — Verificación manual de fugas antes de commit

OSC="/Volumes/OSCognitive"
FOUND=0

echo "🔍 Verificando fugas de información sensible en staging..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Patrón: teléfono mexicano
if git diff --cached | grep -Ei "\+.*(\+52|557\s?724\s?3351|55\s?7724\s?3351)" > /dev/null 2>&1; then
  echo "⚠️  ¡ALERTA! Teléfono detectado en cambios staged"
  FOUND=1
fi

# Patrón: RFC mexicano
if git diff --cached | grep -Ei "\+.*[A-Z]{3,4}[0-9]{6}[A-Z0-9]{3}" > /dev/null 2>&1; then
  echo "⚠️  ¡ALERTA! RFC potencial detectado en cambios staged"
  FOUND=1
fi

# Patrón: email privado en contexto no autorizado
if git diff --cached | grep -Ei "\+.*christian8\.aguirre@gmail\.com" > /dev/null 2>&1; then
  echo "⚠️  ¡ALERTA! Email privado detectado en cambios staged"
  FOUND=1
fi

# Patrón: SSOT_Sensible en staging
if git diff --cached --name-only | grep "SSOT_Sensible" > /dev/null 2>&1; then
  echo "⚠️  ¡ALERTA! SSOT_Sensible/ detectado en staging (¡NO DEBE SUBIR!)"
  FOUND=1
fi

if [ $FOUND -eq 0 ]; then
  echo "✅ Sin fugas detectadas. Listo para commit."
  exit 0
else
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  echo "❌ ACCIÓN REQUERIDA: Elimina información sensible antes de commit"
  echo "   Comando sugerido: git reset HEAD <archivo>"
  exit 1
fi
