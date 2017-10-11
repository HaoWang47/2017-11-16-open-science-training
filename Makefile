

SECTIONS=automation

MD_FILES=$(addsuffix .md,$(SECTIONS))
HTML_FILES=$(addsuffix .html,$(SECTIONS))


all : $(HTML_FILES) notes.pdf

%.html : %.Rmd
	Rscript -e 'rmarkdown::render("$<", "html_document")'

%.md : %.Rmd
	Rscript -e 'knitr::knit("$<")'

notes.pdf : automation.md
	pandoc $(MD_FILES) -o notes.pdf

clean :
	rm -f $(MD_FILES) $(HTML_FILES) notes.pdf

