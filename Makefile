all: main.pdf revision-diff.pdf

main.pdf: *.tex *.bib
	latexmk -pdf main

revision-diff.pdf::
	./differ.sh

clean::
	latexmk -C main
