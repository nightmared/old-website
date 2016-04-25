include config.mk

.PHONY: all clean

all: prepare $(PAGES) extra

SUFFIXES: .md .html

HEADER = header.html
FOOTER = footer.html

extra: $(COPY)
	@cp -R $? output/

%: %.html $(HEADER) $(FOOTER)
	@echo "Generate $@.html"
	@cat $< | cat $(HEADER) - $(FOOTER) > output/$@.html

prepare: clean
	@mkdir output && echo "--> output/ created"

clean:
	@rm -rf output && echo "--> output/ deleted"
