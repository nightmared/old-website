include config.mk

.PHONY: all clean

all: prepare $(PAGES) extra

SUFFIXES: .md .html

HEADER = header.html
FOOTER = footer.html

extra: $(COPY)
	@cp -R $? output/. && echo "--> \"$?\" were copied in output/"

%: %.md $(HEADER) $(FOOTER)
	@echo "Generate $@.html"
	@$(MD) $< | cat $(HEADER) - $(FOOTER) > output/$@.html

prepare: clean
	@mkdir output && echo "--> folder output/ created"

clean:
	@rm -rf output && echo "--> folder output/ deleted"
