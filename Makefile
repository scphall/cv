LATEX = pdflatex -halt-on-error -file-line-error

OUTDIR = aux
PDFDIR = pdfs

all:
	$(LATEX) --output-directory=$(OUTDIR) main_cv
	mv $(OUTDIR)/main_cv.pdf cv.pdf
