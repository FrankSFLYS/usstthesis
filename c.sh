#! /usr/bin/sh
echo "Compiling MyThesis - c.ps1"
xelatex --no-pdf MyThesis.tex
xelatex MyThesis.tex
texcount -brief -sum=1 -ch chapter/*.tex