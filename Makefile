TEX := xelatex
RM := rm -rf -- 

.PHONY: all clean

all: thesis.pdf

clean:
	$(RM) thesis.aux thesis.bbl thesis.bcf thesis.blg thesis.lof thesis.log thesis.pdf thesis.run.xml thesis.toc
	$(RM) model*

thesis.pdf: thesis.tex graphics/pike.jpg
	$(TEX) $<
	biber $(basename $<)
	$(TEX) $<
	$(TEX) $<

model.pdf: thesis.pdf
	pdfseparate thesis.pdf -f 22 -l 33 model-%d.pdf
	pdfunite model-*.pdf model.pdf

$(V).SILENT:
