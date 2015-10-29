LATEX = pdflatex -halt-on-error -file-line-error

BIBDIR = bib
OUTDIR = aux
PDFDIR = pdfs

MAINSCV      = $(wildcard apply*/cv.tex)
MAINSCOVER   = $(wildcard apply*/cover.tex)
TARGETSCV    =  $(subst cv,scph_cv,$(subst .tex,.pdf,$(MAINSCV)))
TARGETSCOVER =  $(subst cover,scph_cover,$(subst .tex,.pdf,$(MAINSCOVER)))
MAINS   = $(MAINSCV) $(MAINSCOVER)
TARGETS = $(TARGETSCV) $(TARGETSCOVER)
CONTENT = $(wildcard content/*.tex)

all: $(TARGETS)

apply_%/scph_cover.pdf: apply_%/cover.tex
	sed 's/XXX/$*/g' content/main_cover.tex > apply_$*/main_cover_$*.tex
	$(LATEX) --output-directory=$(OUTDIR) apply_$*/main_cover_$*
	cp -f $(OUTDIR)/main_cover_$*.pdf apply_$*/scph_cover.pdf

apply_%/scph_cv.pdf: apply_%/cv.tex
	sed 's/XXX/$*/g' content/main_cv.tex > apply_$*/main_cv_$*.tex
	$(LATEX) --output-directory=$(OUTDIR) apply_$*/main_cv_$*
	cp -f $(OUTDIR)/main_cv_$*.pdf apply_$*/scph_cv.pdf

.PHONY: info clean setup
info:
	@echo $(MAINS)
	@echo $(TARGETS)

clean:
	rm -f $(OUTDIR)/* apply*/scph_cv.pdf apply*/scph_cover.pdf apply*/main*.tex

setup:
	mkdir $(PDFDIR)
	mkdir $(OUTDIR)


