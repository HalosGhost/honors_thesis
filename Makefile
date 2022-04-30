TEX := xelatex
RM := rm -rf -- 

.PHONY: all clean

all: thesis.pdf

clean:
	$(RM) thesis.aux thesis.bbl thesis.bcf thesis.blg thesis.lof thesis.log thesis.pdf thesis.run.xml thesis.toc

thesis.pdf: thesis.tex graphics/pike.jpg
	$(TEX) $<
	biber $(basename $<)
	$(TEX) $<
	$(TEX) $<

$(V).SILENT:
