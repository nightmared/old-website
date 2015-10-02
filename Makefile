include config.mk

.PHONY: all clean

all: prepare $(PAGES) extra

SUFFIXES: .md .html

HEADER = header.html
FOOTER = footer.html

extra: $(EXTRA)
	@cp -R $? output/. && echo "--> \"$?\" were copied in output/"

%.html: %.md $(HEADER) $(FOOTER)
	@echo "MARKDOWN `basename $@`"
	@$(MD) $< | cat $(HEADER) - $(FOOTER) > output/$@

prepare: clean
	@mkdir output && echo "--> folder output/ generated"

clean:
	@rm -rf output && echo "--> folder output/ deleted"
