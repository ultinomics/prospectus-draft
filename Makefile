RMD_FILES := $(filter-out _%, $(wildcard *.Rmd))

all: pdf html

html:
	rmtrash ./docs ;\
	cp ~/Dropbox/Scrivener/ZoteroLib.bib ./latex/book.bib ;\
	Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::gitbook')"

pdf: $(RMD_FILES)
	rmtrash ./book-pdf ;\
	Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::pdf_book', output_dir='book-pdf')"
