FILENAME=lathese
PDFFILE=${FILENAME}.pdf
TEXFILE=${FILENAME}.tex

build:
	pdflatex ${TEXFILE}
	bibtex ${FILENAME}
	pdflatex ${TEXFILE}
	pdflatex ${TEXFILE}

clean:
	rm -f *.log *.out *.aux *.blg *.bbl *.toc ${PDFFILE}

# dummy targets
.PHONY: clean
