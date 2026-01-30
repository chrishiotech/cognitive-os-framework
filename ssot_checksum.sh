#!/bin/bash
MANIFEST="/Volumes/OSCognitive/00_CORE_SYSTEM/GEMA_Governance/SSOT_CHECKSUM_MANIFEST.txt"
> "$MANIFEST"

echo "Fecha: $(date)" >> "$MANIFEST"
echo "================================================================" >> "$MANIFEST"

# SSOTs canónicos
echo "SSOT_Identidad_Profesional: $(sha256sum "/Volumes/OSCognitive/00_CORE_SYSTEM/Identidad_Chrishio/SSOT_Lógica/Identidad_Profesional/SSOT_Identidad_Profesional.md" 2>/dev/null | cut -d' ' -f1)" >> "$MANIFEST"
echo "KETOR_Protocol: $(sha256sum "/Volumes/OSCognitive/04_LAB_AI_ENGINEERING/Agents/KETOR/KETOR_Protocol.md" 2>/dev/null | cut -d' ' -f1)" >> "$MANIFEST"
echo "SSOT_BUNDLE_v2: $(sha256sum "/Volumes/OSCognitive/04_LAB_AI_ENGINEERING/Agents/KETOR/SSOT_BUNDLE_KETOR_v2.md" 2>/dev/null | cut -d' ' -f1)" >> "$MANIFEST"
echo "SSOT_Metodologia: $(sha256sum "/Volumes/OSCognitive/00_CORE_SYSTEM/Identidad_Chrishio/SSOT_Lógica/Valores/SSOT_Metodologia.md" 2>/dev/null | cut -d' ' -f1)" >> "$MANIFEST"

# CVs verificados
echo "CV_Maestro_ES: $(sha256sum "/Volumes/OSCognitive/00_CORE_SYSTEM/Identidad_Chrishio/CV/CV_Maestro_ES.md" 2>/dev/null | cut -d' ' -f1)" >> "$MANIFEST"
echo "CV_International_US_EN: $(sha256sum "/Volumes/OSCognitive/00_CORE_SYSTEM/Identidad_Chrishio/CV/CV_International_US_EN.md" 2>/dev/null | cut -d' ' -f1)" >> "$MANIFEST"

# Guardianía
echo "GEMA_Guardian_Spec: $(sha256sum "/Volumes/OSCognitive/00_CORE_SYSTEM/GEMA_Governance/GEMA_Guardian/GEMA_Guardian_Spec.md" 2>/dev/null | cut -d' ' -f1)" >> "$MANIFEST"
echo "TEST_KETOR_ACCESS: $(sha256sum "/Volumes/OSCognitive/00_CORE_SYSTEM/GEMA_Governance/TEST_KETOR_ACCESS.md" 2>/dev/null | cut -d' ' -f1)" >> "$MANIFEST"
echo "VALIDATION_PUBLIC_ACCESS: $(sha256sum "/Volumes/OSCognitive/00_CORE_SYSTEM/GEMA_Governance/VALIDATION_PUBLIC_ACCESS.md" 2>/dev/null | cut -d' ' -f1)" >> "$MANIFEST"

echo "✅ Checksums generados exitosamente" >> "$MANIFEST"
echo "⚠️ ADVERTENCIA: Este manifest NO contiene datos sensibles." >> "$MANIFEST"
