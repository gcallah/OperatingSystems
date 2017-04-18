INCS = $(shell ls quizzes/quiz*.html)
HTMLFILES = $(shell ls *.ptml | sed -e 's/ptml/html/g')
 
%.html: %.ptml $(INCS)
	html_include.awk <$< >$@

website: $(INCS) $(HTMLFILES)
	git commit -a -m "HTML rebuild."
	git push origin master

clean:
	rm $(HTMLFILES)
