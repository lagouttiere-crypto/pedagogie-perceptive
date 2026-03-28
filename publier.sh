#!/bin/bash

# Dossier Obsidian
OBSIDIAN="/Users/matthieugaudeau/Library/Mobile Documents/iCloud~md~obsidian/Documents/Technique Alexander/noyau théorique/Pédagogie-Perceptive"

# Copie depuis Obsidian vers Quarto
cp "$OBSIDIAN/introduction.md" /Users/matthieugaudeau/Documents/pedagogie-enactive/intro.qmd
cp "$OBSIDIAN/chapitre-1.md" /Users/matthieugaudeau/Documents/pedagogie-enactive/chapitre-1.qmd

# Publie
quarto render
git add .
git commit -m "mise à jour"
git push
