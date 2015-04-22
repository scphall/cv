LATEX = pdflatex -halt-on-error -file-line-error

BIBDIR = bib
OUTDIR = aux
PDFDIR = pdfs

MAINS = $(wildcard *.tex)
TARGETS = $(addsuffix .pdf,$(addprefix $(PDFDIR)/,$(subst .tex,,$(MAINS))))
CONTENT = $(wildcard content/*.tex)

all: $(TARGETS)

$(PDFDIR)/%.pdf: %.tex
	sed 's/XXX/$*/g' content/main.tex > $(OUTDIR)/$*.tex
	$(LATEX) --output-directory=$(OUTDIR) -draftmode $(OUTDIR)/$*
	$(LATEX) --output-directory=$(OUTDIR) $(OUTDIR)/$*
	cp -f $(OUTDIR)/$*.pdf $(PDFDIR)/.


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


