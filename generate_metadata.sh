#!/bin/bash
OUTPUT="/Volumes/OSCognitive/00_CORE_SYSTEM/GEMA_Governance/SYSTEM_METADATA_FRESH.json"
> "$OUTPUT"
echo '{
  "scan_timestamp": "'$(date -u +%Y-%m-%dT%H:%M:%SZ)'",
  "system_version": "2.0",
  "files_scanned": [' >> "$OUTPUT"
find /Volumes/OSCognitive -type f \( -name "SSOT_*.md" -o -name "CV_*.md" -o -name "MATRIZ_*.md" -o -name "KETOR_*.md" -o -name "SYSTEM_METADATA*.json" \) \
  -not -path "*/.*" \
  -not -path "*/SSOT_Sensible/*" \
  -not -path "*/Snapshots/*" \
  -not -path "*/AnythingLLM_Kernel/*" \
  -not -path "*/Experiments/*" \
  -not -path "*/Reference_Library/*" \
  -not -path "*/Daily_Logs/*" \
  -not -path "*/Decisiones/*" \
  -not -path "*/Roadmaps/*" \
  | while read -r file; do
  [[ "$file" == *".Trashes"* ]] && continue
  [[ "$file" == *".fseventsd"* ]] && continue
  [[ "$file" == *"._"* ]] && continue
  checksum=$(sha256sum "$file" 2>/dev/null | cut -d' ' -f1 || echo "ERROR")
  echo "    {\"name\": \"$(basename "$file")\", \"physical_path\": \"$file\", \"checksum\": \"$checksum\"}," >> "$OUTPUT"
done
sed -i '' -e '$ s/,$//' "$OUTPUT" 2>/dev/null || true
echo '  ]
}' >> "$OUTPUT"
count=$(grep -c '"name"' "$OUTPUT" 2>/dev/null || echo "0")
echo "✅ Archivos monitoreados: $count"
