include config.mk

.PHONY: all clean

all: $(PAGES) extra

clean:
	rm -f $(PAGES)

SUFFIXES: .md .html

HEADER = header.html
FOOTER = footer.html

extra: $(EXTRA)
	@echo "copying $? in output/"
	@cp -R $? output/.

%.html: %.md $(HEADER) $(FOOTER)
	@echo "MARKDOWN `basename $@`"
	@$(MD) $< | cat $(HEADER) - $(FOOTER) > output/$@
