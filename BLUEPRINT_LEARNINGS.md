# Cognitive OS Blueprint — Lecciones Clave

Documento de conocimientos para replicar la arquitectura en el futuro.

## Principios Fundamentales

1. **Separación sensible/lógica**
   - Carpeta `SSOT_Sensible/` NUNCA en GitHub
   - Solo lógica profesional en repos públicos

2. **Verificación POSIX > Confianza en LLMs**
   - Usar `sha256sum`, `stat`, `find` para integridad
   - LLMs solo para análisis estratégico, no verificación

3. **ASCII puro en rutas del sistema**
   - Eliminar emojis de nombres de carpetas
   - Compatibilidad multiplataforma garantizada

4. **Optimización ATS ≠ Invención**
   - Permitido: "HTML5" → "HTML", añadir "Git" si usaste GitHub
   - Prohibido: Inventar experiencia no verificable

## Estructura Canónica
/Volumes/OSCognitive/
├── 00_CORE_SYSTEM/ # Verdad absoluta

├── 01_CAPA_ESTRATEGICA/ # Cerebro evolutivo

├── 02_VERTICALES_PROPIAS/ # Proyectos propios

├── 03_TENANTS_CLIENTES/ # Clientes externos

├── 04_LAB_AI_ENGINEERING/ # Experimentación técnica

├── 05_NOTEBOOKLM/ # Cerebro redundante

└── 99_ARCHIVE/ # Historial

## Scripts Esenciales

| Script | Propósito |
|--------|-----------|
| `master_sync.sh` | Ciclo completo: metadata → integridad → XRAY → GitHub |
| `verify_integrity.sh` | Compara libro mayor vs sistema real |
| `xray_report.sh` | Reporte minimalista de cambios recientes |
| `escudo_publico.sh` | Verifica que sensibles estén protegidos |

## Aliases Útiles (.zshrc)

```bash
alias cog-sync="bash ./scripts/master_sync.sh"
alias cog-check="bash ./scripts/verify_integrity.sh"
alias cog-xray="bash ./scripts/xray_report.sh"
alias cog-guardian="bash ./scripts/escudo_publico.sh"
