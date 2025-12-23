#!/usr/bin/env bash
set -e

FORCE=false

if [[ "$1" == "-f" || "$1" == "--force" ]]; then
  FORCE=true
fi

for src in *_light_macos_1024w.png; do
  base="${src%_light_macos_1024w.png}"
  out="${base}_favicon.ico"

  if [[ -f "$out" && "$FORCE" == false ]]; then
    echo "⏭  Skipping $out (already exists)"
    continue
  fi

  echo "▶ Generating $out"

  magick "$src" \
    -define icon:auto-resize=16,32,48,64,128,256 \
    "$out"
done

echo "✅ Favicons done"

