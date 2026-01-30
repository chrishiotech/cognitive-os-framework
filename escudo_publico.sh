#!/bin/bash
# escudo_publico.sh — Verificación de integridad en modo LOCAL (repo privado)

OSC="/Volumes/OSCognitive"
REPORT="$OSC/00_CORE_SYSTEM/GEMA_Governance/XRAY_Reports/ESCUDO_PUBLICO_$(date +%Y%m%d_%H%M%S).md"

echo "🛡️  ESCUDO_PÚBLICO — Verificación de integridad LOCAL (repo privado)" | tee "$REPORT"
echo "Fecha: $(date)" | tee -a "$REPORT"
echo "================================================================" | tee -a "$REPORT"
echo "" | tee -a "$REPORT"

# Contadores
LOCAL_OK=0
LOCAL_MISSING=0
SENSITIVE_LEAKS=0

echo "## 1. VERIFICACIÓN DE ARCHIVOS QUE DEBEN EXISTIR LOCALMENTE" | tee -a "$REPORT"
echo "" | tee -a "$REPORT"

# Lista de archivos que deben existir localmente
PUBLIC_FILES=(
"$OSC/00_CORE_SYSTEM/Identidad_Chrishio/CV/CV_Maestro_ES.md"
"$OSC/00_CORE_SYSTEM/Identidad_Chrishio/CV/CV_Tecnico_Puro_ES.md"
"$OSC/00_CORE_SYSTEM/Identidad_Chrishio/CV/CV_Consultoria_Tecnica_ES.md"
"$OSC/00_CORE_SYSTEM/Identidad_Chrishio/CV/CV_Liderazgo_Tecnico_ES.md"
"$OSC/00_CORE_SYSTEM/Identidad_Chrishio/CV/CV_International_US_EN.md"
"$OSC/00_CORE_SYSTEM/Identidad_Chrishio/SSOT_Logica/Identidad_Profesional/SSOT_Identidad_Profesional.md"
"$OSC/00_CORE_SYSTEM/Identidad_Chrishio/SSOT_Logica/Valores/SSOT_Metodologia.md"
"$OSC/04_LAB_AI_ENGINEERING/Agents/KETOR/KETOR_Protocol.md"
"$OSC/04_LAB_AI_ENGINEERING/Agents/KETOR/SSOT_BUNDLE_KETOR.md"
"$OSC/04_LAB_AI_ENGINEERING/Agents/KETOR/SSOT_BUNDLE_KETOR_v2.md"
"$OSC/README.md"
"$OSC/00_CORE_SYSTEM/GEMA_Governance/VALIDATION_PUBLIC_ACCESS.md"
"$OSC/00_CORE_SYSTEM/GEMA_Governance/MATRIZ_CONTEXTO.md"
)

for file_path in "${PUBLIC_FILES[@]}"; do
  if [ -f "$file_path" ]; then
    echo "✅ $(basename "$file_path"): Existe localmente" | tee -a "$REPORT"
    ((LOCAL_OK++))
  else
    echo "❌ $(basename "$file_path"): NO EXISTE localmente" | tee -a "$REPORT"
    ((LOCAL_MISSING++))
  fi
done

echo "" | tee -a "$REPORT"
echo "## 2. VERIFICACIÓN DE ARCHIVOS QUE NO DEBEN SER ACCESIBLES" | tee -a "$REPORT"
echo "" | tee -a "$REPORT"

# Lista de archivos sensibles que NO deben estar en GitHub (pero sí existen localmente)
SENSITIVE_FILES=(
"$OSC/00_CORE_SYSTEM/Identidad_Chrishio/SSOT_Sensible/Contacto_Personal/SSOT_Contacto_Sensible.md"
"$OSC/00_CORE_SYSTEM/Identidad_Chrishio/SSOT_Sensible/Fiscal_AguirreTech/SSOT_Fiscal_AguirreTech.md"
"$OSC/00_CORE_SYSTEM/Identidad_Chrishio/SSOT_Sensible/Metodologia_Consultoria/SSOT_Metodologia_Piloto_Cancelable.md"
"$OSC/00_CORE_SYSTEM/Identidad_Chrishio/SSOT_Sensible/Metodologia_Consultoria/SSOT_Patrones_Diagnostico.md"
)

for file_path in "${SENSITIVE_FILES[@]}"; do
  if [ -f "$file_path" ]; then
    echo "✅ $(basename "$file_path"): Correctamente PRIVADO (existe solo localmente)" | tee -a "$REPORT"
  else
    echo "⚠️  $(basename "$file_path"): NO EXISTE (¿fue eliminado accidentalmente?)" | tee -a "$REPORT"
    ((SENSITIVE_LEAKS++))
  fi
done

echo "" | tee -a "$REPORT"
echo "## 3. RESUMEN DE INTEGRIDAD LOCAL" | tee -a "$REPORT"
echo "================================================================" | tee -a "$REPORT"
echo "✅ Archivos locales correctos: $LOCAL_OK" | tee -a "$REPORT"
echo "⚠️  Archivos locales faltantes: $LOCAL_MISSING" | tee -a "$REPORT"
echo "❌ Problemas con sensibles: $SENSITIVE_LEAKS" | tee -a "$REPORT"
echo "" | tee -a "$REPORT"

if [ $LOCAL_MISSING -gt 0 ] || [ $SENSITIVE_LEAKS -gt 0 ]; then
  echo "❌ ESTADO: INTEGRIDAD LOCAL COMPROMETIDA" | tee -a "$REPORT"
  echo "⚠️  Acciones requeridas:" | tee -a "$REPORT"
  if [ $LOCAL_MISSING -gt 0 ]; then
    echo "   • Restaurar archivos locales faltantes desde backup" | tee -a "$REPORT"
  fi
  if [ $SENSITIVE_LEAKS -gt 0 ]; then
    echo "   • Verificar si archivos sensibles fueron eliminados accidentalmente" | tee -a "$REPORT"
  fi
  exit 1
else
  echo "✅ ESTADO: INTEGRIDAD LOCAL VERIFICADA" | tee -a "$REPORT"
  echo "   Todos los archivos lógicos existen localmente y los sensibles están protegidos." | tee -a "$REPORT"
  exit 0
fi
