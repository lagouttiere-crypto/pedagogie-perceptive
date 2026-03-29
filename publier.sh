#!/bin/bash

OBSIDIAN="/Users/matthieugaudeau/Library/Mobile Documents/iCloud~md~obsidian/Documents/Technique Alexander/noyau théorique/Pédagogie-Perceptive"

# Copie index
cp "$OBSIDIAN/index.md" /Users/matthieugaudeau/Documents/pedagogie-enactive/index.qmd

# Copie tous les fichiers numérotés
for f in "$OBSIDIAN"/[0-9]*.md; do
    base=$(basename "$f" .md)
    cp "$f" /Users/matthieugaudeau/Documents/pedagogie-enactive/"$base".qmd
done

# Copie les images
cp -r "$OBSIDIAN/photos/" /Users/matthieugaudeau/Documents/pedagogie-enactive/images/

# Génère automatiquement la liste des chapitres dans _quarto.yml
CHAPTERS="  chapters:\n    - index.qmd"
for f in /Users/matthieugaudeau/Documents/pedagogie-enactive/[0-9]*.qmd; do
    base=$(basename "$f")
    CHAPTERS="$CHAPTERS\n    - $base"
done

# Met à jour _quarto.yml
sed -i '' '/  chapters:/,/^[^ ]/{ /  chapters:/!{ /^[^ ]/!d; }; }' _quarto.yml
sed -i '' "s|  chapters:|$CHAPTERS|" _quarto.yml

# Copie cover après render
cp images/cover.jpg docs/images/ 2>/dev/null

# Publie
quarto render
cp images/cover.jpg docs/images/
git add .
git commit -m "mise à jour"
git push