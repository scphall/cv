LATEX = pdflatex -halt-on-error -file-line-error

BIBDIR = bib
OUTDIR = aux
PDFDIR = pdfs

MAINSCV = $(wildcard cv_*.tex)
MAINSCOVER = $(wildcard cover_*.tex)
#MAINS = $(wildcard cv_*.tex) $(wildcard cover_*.tex)
MAINS = $(MAINSC) $(MAINSCOVER)
TARGETSCV = $(addsuffix .pdf,$(addprefix $(PDFDIR)/,$(subst .tex,,$(MAINSCV))))
TARGETSCOVER = $(addsuffix .pdf,$(addprefix $(PDFDIR)/,$(subst .tex,,$(MAINSCOVER))))
#TARGETS = $(addsuffix .pdf,$(addprefix $(PDFDIR)/,$(subst .tex,,$(MAINS))))
TARGETS = $(TARGETSCV) $(TARGETSCOVER)
CONTENT = $(wildcard content/*.tex)

all: $(TARGETS)

cv: $(TARGETSCV)

cover: $(TARGETSCOVER)

$(PDFDIR)/cv_%.pdf: cv_%.tex
	sed 's/XXX/cv_$*/g' content/cv_main.tex > $(OUTDIR)/cv_$*.tex
	@#$(LATEX) --output-directory=$(OUTDIR) -draftmode $(OUTDIR)/cv_$*
	$(LATEX) --output-directory=$(OUTDIR) $(OUTDIR)/cv_$*
	cp -f $(OUTDIR)/cv_$*.pdf $(PDFDIR)/.

$(PDFDIR)/cover_%.pdf: cover_%.tex
	sed 's/XXX/cover_$*/g' content/cover_main.tex > $(OUTDIR)/cover_$*.tex
	@#$(LATEX) --output-directory=$(OUTDIR) -draftmode $(OUTDIR)/cover_$*
	$(LATEX) --output-directory=$(OUTDIR) $(OUTDIR)/cover_$*
	cp -f $(OUTDIR)/cover_$*.pdf $(PDFDIR)/.

.PHONY: info clean setup
info:
	@echo $(MAINS)
	@echo $(TARGETS)
	@echo $(CONTENT)

clean:
	rm -f $(OUTDIR)/* $(PDFDIR)/*.pdf

setup:
	mkdir $(PDFDIR)
	mkdir $(OUTDIR)


