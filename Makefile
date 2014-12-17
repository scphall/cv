MAIN = main
OUTPUT = cv

LATEX = pdflatex
AUXDIR = aux

FIGEXT = .pdf
MAINEXT= .pdf

GENERATED = $(OUTPUT)$(MAINEXT)
BUILDCOMMAND = $(LATEX) --output-directory=$(AUXDIR) $(MAIN)
BUILDCOMMAND += && mv -f $(AUXDIR)/$(MAIN)$(MAINEXT) $(GENERATED)

TEXSOURCES = $(wildcard *.tex)

$(GENERATED): $(TEXSOURCES) Makefile
	$(BUILDCOMMAND)

all: $(GENERATED)

.PHONY : clean

clean:
	rm -f $(AUXDIR)/* $(GENERATED)
