#!/bin/bash

OBSIDIAN="/Users/matthieugaudeau/Library/Mobile Documents/iCloud~md~obsidian/Documents/Technique Alexander/noyau théorique/Pédagogie-Perceptive"

cp "$OBSIDIAN/introduction.md" /Users/matthieugaudeau/Documents/pedagogie-enactive/intro.qmd
cp "$OBSIDIAN/chapitre-1.md" /Users/matthieugaudeau/Documents/pedagogie-enactive/chapitre-1.qmd
cp -r "$OBSIDIAN/photos/" /Users/matthieugaudeau/Documents/pedagogie-enactive/images/

quarto render
git add .
git commit -m "mise à jour"
git push