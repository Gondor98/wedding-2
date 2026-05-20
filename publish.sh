#!/bin/bash
# Quick publish script for wedding invitation #2
# Usage: ./publish.sh [path-to-index.html]

WEDDING_DIR="$HOME/wedding-2"
SOURCE="${1:-$HOME/Downloads/index.html}"

if [ ! -f "$SOURCE" ]; then
    echo "❌ File not found: $SOURCE"
    echo "Usage: ./publish.sh [path-to-index.html]"
    echo "  Default looks for: ~/Downloads/index.html"
    exit 1
fi

echo "📋 Copying $SOURCE to wedding-2 site..."
cp "$SOURCE" "$WEDDING_DIR/index.html"

cd "$WEDDING_DIR"
git add -A
git commit -m "Update wedding invitation - $(date '+%Y-%m-%d %H:%M')"
git push origin main

echo ""
echo "✅ Published! Your invitation will be live in ~30 seconds at:"
echo "   🔗 https://gondor98.github.io/wedding-2/"
echo ""
