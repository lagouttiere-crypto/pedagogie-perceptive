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

# Publie
quarto render
cp images/cover.jpg docs/images/
git add .
git commit -m "mise à jour"
git push