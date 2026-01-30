#!/bin/bash
# show_file_matrix.sh — Matriz visual humana de archivos monitoreados

echo ""
echo "┌────────────────────────────────────────────────────────────────────────────────┐"
echo "│  📊 MATRIZ DE ARCHIVOS MONITOREADOS (26)                                       │"
echo "├──────┬────────────────────────┬──────────┬──────────┬─────────────────────────┤"
echo "│ TIPO │ NOMBRE                 │ ÚLT.ACT  │ META     │ DESCRIPCIÓN             │"
echo "├──────┼────────────────────────┼──────────┼──────────┼─────────────────────────┤"

# Función para obtener fecha legible (día/mes/año)
get_date() {
  stat -f "%Sm" -t "%d/%m/%y" "$1" 2>/dev/null || echo "n/a"
}

# SSOTs Canónicos
echo "│ 🔑   │ SSOT_Identidad_Pro...  │ $(get_date "/Volumes/OSCognitive/00_CORE_SYSTEM/Identidad_Chrishio/SSOT_Lógica/Identidad_Profesional/SSOT_Identidad_Profesional.md") │ público  │ Verdad profesional      │"
echo "│ 🔑   │ SSOT_Metodologia       │ $(get_date "/Volumes/OSCognitive/00_CORE_SYSTEM/Identidad_Chrishio/SSOT_Lógica/Valores/SSOT_Metodologia.md") │ público  │ Valores no negociables  │"
echo "│ 🔑   │ SSOT_Vertical_Turismo  │ $(get_date "/Volumes/OSCognitive/02_VERTICALES_PROPIAS/Proyectos_Impacto/Turismo/SSOT_Vertical_Turismo.md") │ público  │ PYMEs turísticas        │"
echo "│ 🔑   │ SSOT_Cliente_Template  │ $(get_date "/Volumes/OSCognitive/03_TENANTS_CLIENTES/SSOT_Cliente_Template.md") │ público  │ Onboarding clientes     │"
echo "│ 🔑   │ SSOT_Gobernanza_Oper...│ $(get_date "/Volumes/OSCognitive/00_CORE_SYSTEM/GEMA_Governance/SSOT_Gobernanza_Operativa.md") │ público  │ 4 Reglas de Oro         │"
echo "│ 🔑   │ SSOT_Inventario_Sist...│ $(get_date "/Volumes/OSCognitive/00_CORE_SYSTEM/GEMA_Governance/SSOT_Inventario_Sistema.md") │ público  │ Mapa del sistema        │"
echo "│ 🔑   │ SSOT_ONBOARDING_MANUAL │ $(get_date "/Volumes/OSCognitive/00_CORE_SYSTEM/GEMA_Governance/SSOT_ONBOARDING_MANUAL.md") │ público  │ Guía para LLMs          │"

# CVs
echo "├──────┼────────────────────────┼──────────┼──────────┼─────────────────────────┤"
echo "│ 📄   │ CV_Maestro_ES.md       │ $(get_date "/Volumes/OSCognitive/00_CORE_SYSTEM/Identidad_Chrishio/CV/CV_Maestro_ES.md") │ ATS      │ Base IMSS-verificable   │"
echo "│ 📄   │ CV_International_US... │ $(get_date "/Volumes/OSCognitive/00_CORE_SYSTEM/Identidad_Chrishio/CV/CV_International_US_EN.md") │ ATS      │ Mercado USA             │"
echo "│ 📄   │ CV_Tecnico_Puro_ES.md  │ $(get_date "/Volumes/OSCognitive/00_CORE_SYSTEM/Identidad_Chrishio/CV/CV_Tecnico_Puro_ES.md") │ ATS      │ Enfoque técnico puro    │"
echo "│ 📄   │ CV_Consultoria_Tecn... │ $(get_date "/Volumes/OSCognitive/00_CORE_SYSTEM/Identidad_Chrishio/CV/CV_Consultoria_Tecnica_ES.md") │ ATS      │ Consultoría técnica     │"
echo "│ 📄   │ CV_Liderazgo_Tecnico...│ $(get_date "/Volumes/OSCognitive/00_CORE_SYSTEM/Identidad_Chrishio/CV/CV_Liderazgo_Tecnico_ES.md") │ ATS      │ Liderazgo tecnológico   │"

# Agentes
echo "├──────┼────────────────────────┼──────────┼──────────┼─────────────────────────┤"
echo "│ 🤖   │ KETOR_Protocol.md      │ $(get_date "/Volumes/OSCognitive/04_LAB_AI_ENGINEERING/Agents/KETOR/KETOR_Protocol.md") │ agente   │ Reglas de operación     │"
echo "│ 🤖   │ SSOT_BUNDLE_KETOR_v2.md│ $(get_date "/Volumes/OSCognitive/04_LAB_AI_ENGINEERING/Agents/KETOR/SSOT_BUNDLE_KETOR_v2.md") │ agente   │ Kernel autocontenido    │"

# Matrices
echo "├──────┼────────────────────────┼──────────┼──────────┼─────────────────────────┤"
echo "│ 🧭   │ MATRIZ_CONTEXTO.md     │ $(get_date "/Volumes/OSCognitive/00_CORE_SYSTEM/GEMA_Governance/MATRIZ_CONTEXTO.md") │ sistema  │ Mapa para LLMs          │"
echo "│ 🧭   │ MATRIZ_ESTADO_SISTEMA..│ $(get_date "/Volumes/OSCognitive/00_CORE_SYSTEM/GEMA_Governance/MATRIZ_ESTADO_SISTEMA.md") │ sistema  │ Snapshot del sistema    │"

# Governance
echo "├──────┼────────────────────────┼──────────┼──────────┼─────────────────────────┤"
echo "│ ⚙️    │ GEMA_Guardian_Spec.md  │ $(get_date "/Volumes/OSCognitive/00_CORE_SYSTEM/GEMA_Governance/GEMA_Guardian/GEMA_Guardian_Spec.md") │ guardian │ Patrones de fugas       │"
echo "│ ⚙️    │ TEST_KETOR_ACCESS.md   │ $(get_date "/Volumes/OSCognitive/00_CORE_SYSTEM/GEMA_Governance/TEST_KETOR_ACCESS.md") │ test     │ Prueba de acceso        │"
echo "│ ⚙️    │ VALIDATION_PUBLIC_ACC..│ $(get_date "/Volumes/OSCognitive/00_CORE_SYSTEM/GEMA_Governance/VALIDATION_PUBLIC_ACCESS.md") │ test     │ Conectividad multi-LLM  │"
echo "│ ⚙️    │ SSOT_Governance.md     │ $(get_date "/Volumes/OSCognitive/00_CORE_SYSTEM/GEMA_Governance/SSOT_Governance.md") │ sistema  │ Gobernanza base         │"

# Otros
echo "├──────┼────────────────────────┼──────────┼──────────┼─────────────────────────┤"
echo "│ 📁   │ SYSTEM_METADATA.json   │ $(get_date "/Volumes/OSCognitive/00_CORE_SYSTEM/GEMA_Governance/SYSTEM_METADATA.json") │ sistema  │ Índice de archivos      │"
echo "│ 📁   │ SSOT_CHECKSUM_MANIFEST.│ $(get_date "/Volumes/OSCognitive/00_CORE_SYSTEM/GEMA_Governance/SSOT_CHECKSUM_MANIFEST.txt") │ sistema  │ Hashes de integridad    │"
echo "│ 📁   │ SSOT_AI_LAB.md         │ $(get_date "/Volumes/OSCognitive/04_LAB_AI_ENGINEERING/SSOT_AI_LAB.md") │ lab      │ Experimentos AI         │"
echo "│ 📁   │ SSOT_NotebookLM.md     │ $(get_date "/Volumes/OSCognitive/05_NOTEBOOKLM/SSOT_NotebookLM.md") │ lab      │ Cerebro redundante      │"
echo "│ 📁   │ SSOT_Cerebro.md        │ $(get_date "/Volumes/OSCognitive/01_CAPA_ESTRATEGICA/Cerebro_Evolutivo/SSOT_Cerebro.md") │ estrateg │ Cerebro evolutivo       │"
echo "│ 📁   │ SSOT_Vertical.md       │ $(get_date "/Volumes/OSCognitive/02_VERTICALES_PROPIAS/AguirreTechConsulting/SSOT_Vertical.md") │ vertical │ AguirreTech base        │"

echo "└──────┴────────────────────────┴──────────┴──────────┴─────────────────────────┘"
echo ""
echo "💡 Leyenda: 🔑=SSOT | 📄=CV | 🤖=Agente | 🧭=Matriz | ⚙️=Governance | 📁=Sistema"
echo "   META: público=visible en GitHub | ATS=optimizado para filtros | sensible=NUNCA público"
