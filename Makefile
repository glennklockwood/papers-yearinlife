all: main.pdf

main.pdf: *.tex *.bib
	latexmk -pdf main

.PHONY: revision-diff.pdf
revision-diff.pdf:
	./differ.sh

clean::
	latexmk -C main
