

SECTIONS=slides/automation-slides topics/automation

MD_FILES=$(addsuffix .md,$(SECTIONS))
HTML_FILES=$(addsuffix .html,$(SECTIONS))

all : $(HTML_FILES)
	@echo All files are now up to date

%.html : %.Rmd
	Rscript -e 'rmarkdown::render("$<")'

%.md : %.Rmd
	Rscript -e 'knitr::knit("$<")'

#notes.pdf : automation.md
#	pandoc $(MD_FILES) -o notes.pdf

clean :
	rm -f $(MD_FILES) $(HTML_FILES) notes.pdf

