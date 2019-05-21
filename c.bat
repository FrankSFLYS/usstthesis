echo Compiling MyThesis - c.bat
xelatex --no-pdf MyThesis.tex
xelatex MyThesis.tex
texcount -brief -sum=1 -ch chapter/*.tex