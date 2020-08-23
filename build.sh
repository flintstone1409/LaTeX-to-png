#!/bin/sh

################################################################################
#                                some settings                                 #
################################################################################

# your destination folder
folder=~/your/folder/here

# the dpi (I recommend using high dpi (about 3000) to have
# nice quality even when exporting just a few characters)
dpi=3000

# the output destination of the console log/spam done by latex
console=/dev/null

################################################################################
#                                  functions                                   #
################################################################################

build()
{
	# build document
	pdflatex export.tex > ${console}

	# crop to size of text
	pdfcrop export.pdf > ${console}

	# export to png (with 3000dpi)
	pdftoppm export-crop.pdf -png -r ${dpi} exported > ${console}
}

move()
{
	# move image to destination; copy .tex file for later changes
	mv exported-1.png ${folder}/$1.png
	cp export.tex ${folder}/$1.tex
}

clean()
{
	# clean up temp files from latex (-f to not complain about missing files)
	rm -f *.aux *.dvi *.fdb_latexmk *.fls *.log *.out *.toc *.pdf
}

################################################################################
#                                     exec                                     #
################################################################################

# error if no argument given
if [[ $# -eq 0 ]] ; then
    echo 'You need to give a filename for your image'
	echo 'Syntax: '$0' <filename>'
    exit 1
fi

build
move $1
clean
