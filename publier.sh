#!/bin/bash

# Dossier Obsidian
OBSIDIAN="/Users/matthieugaudeau/Library/Mobile 
Documents/iCloud~md~obsidian/Documents/Technique 
Alexander/noyau théorique/Pédagogie-Perceptive"

# Copie depuis Obsidian vers Quarto
cp "$OBSIDIAN/introduction.md" 
~/Documents/pedagogie-enactive/intro.qmd
cp "$OBSIDIAN/chapitre-1.md" 
~/Documents/pedagogie-enactive/chapitre-1.qmd

# Publie
quarto render
git add .
git commit -m "mise à jour"
git push#!/bin/bash

# Copie depuis Obsidian
cp "/Users/matthieugaudeau/Library/Mobile 
Documents/iCloud~md~obsidian/Documents/Technique 
Alexander/noyau théorique/"*.md ~/Documents/pedagogie-enactive/

# Renomme les .md en .qmd
for f in ~/Documents/pedagogie-enactive/*.md; do
    mv "$f" "${f%.md}.qmd"
done

# Publie
quarto render
git add .
git commit -m "mise à jour"
git push#!/bin/bash 
quarto render git add .
git commit -m "mise à jour"
git push
