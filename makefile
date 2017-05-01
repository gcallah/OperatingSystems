HTMLFILES = $(shell ls *.ptml | sed -e 's/ptml/html/g')
INCS = menu.txt
 
%.html: %.ptml $(INCS)
	html_include.awk <$< >$@

website: quizzes $(HTMLFILES) $(INCS)
	cd quizzes ; make all
	-git commit -a -m "HTML rebuild."
	git push origin master

quizzes:
	cd quizzes ; make all

local: $(HTMLFILES)

clean:
	touch *.ptml
	cd quizzes ; make clean
