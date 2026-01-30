#!/bin/bash
# generate_metadata.sh — Escaneo quirúrgico de SSOTs y CVs críticos (versión pública segura)

OUTPUT="./demo/SYSTEM_METADATA_FRESH.json"
> "$OUTPUT"

echo '{
  "scan_timestamp": "'$(date -u +%Y-%m-%dT%H:%M:%SZ)'",
  "system_version": "2.0",
  "files_scanned": [' >> "$OUTPUT"

# Escanear SOLO archivos de demo (nunca rutas absolutas)
find ./demo -type f \( -name "SSOT_*.md" -o -name "CV_*.md" -o -name "SYSTEM_METADATA*.json" \) \
  -not -path "*/.*" \
  | sort | while read -r file; do
  checksum=$(sha256sum "$file" 2>/dev/null | cut -d' ' -f1 || echo "ERROR")
  size=$(stat -f%z "$file" 2>/dev/null || echo "0")
  mtime=$(stat -f%Sm -t "%Y-%m-%d %H:%M:%S" "$file" 2>/dev/null || echo "unknown")
  filename=$(basename "$file")
  
  echo "    {
      \"name\": \"$filename\",
      \"physical_path\": \"$file\",
      \"checksum\": \"$checksum\",
      \"size_bytes\": $size,
      \"last_modified\": \"$mtime\"
    }," >> "$OUTPUT"
done

# Cerrar JSON
sed -i '' -e '$ s/,$//' "$OUTPUT" 2>/dev/null || true
echo '  ]
}' >> "$OUTPUT"

count=$(grep -c '"name"' "$OUTPUT" 2>/dev/null || echo "0")
echo "✅ Archivos monitoreados: $count"
