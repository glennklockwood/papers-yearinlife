all: main.pdf

main.pdf: *.tex *.bib
	latexmk -pdf main

clean::
	latexmk -C main
