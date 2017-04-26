HTMLFILES = $(shell ls *.ptml | sed -e 's/ptml/html/g')
INCS = menu.txt
 
%.html: %.ptml $(INCS)
	html_include.awk <$< >$@

website: $(HTMLFILES) $(INCS) quizzes
	-git commit -a -m "HTML rebuild."
	git push origin master

quizzes:
	cd quizzes; ${MAKE} all

local: $(HTMLFILES)

clean:
	rm $(HTMLFILES)
