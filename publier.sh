#!/bin/bash
quarto render
git add .
git commit -m "mise à jour"
git push
