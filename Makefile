

SECTIONS= \
    index \
    slides/introduction \
    slides/markup \
    topics/automation

HTML_FILES=$(addsuffix .html,$(SECTIONS))

all : $(HTML_FILES)
	@echo All files are now up to date

%.html : %.Rmd
	Rscript -e 'rmarkdown::render("$<")'

#%.md : %.Rmd
#	Rscript -e 'knitr::knit("$<","$@")'
#
#notes.pdf : topics/automation.md
#	pandoc topics/automation.md -o notes.pdf

clean :
	rm -f $(HTML_FILES)



