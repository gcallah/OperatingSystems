QINCS = $(shell ls quizzes/quiz*.txt | sed -e 's/txt/qhtm/g')
QUIZZES = $(shell ls quizzes/quiz*.txt)
HTMLFILES = $(shell ls *.ptml | sed -e 's/ptml/html/g')
 
%.html: %.ptml $(INCS)
	html_include.awk <$< >$@

website: $(HTMLFILES)
	./make_quizzes.sh
	git commit -a -m "HTML rebuild."
	git push origin master

local: $(HTMLFILES)

clean:
	rm $(HTMLFILES)
