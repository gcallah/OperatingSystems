QINCS = $(shell ls quiz*.txt | sed -e 's/txt/qhtm/g')
TEST = $(shell ls quiz*.txt | sed -e 's/txt/thtm/g')
QUIZZES = $(shell ls quiz*.txt)

%.qhtm: %.txt
	../utils/quiz2html.py $< >$@

%.thtm: %.txt
	../utils/quiz2test.py $< >$@

quiz: $(QINCS)

test: $(TEST)

clean:
	touch *.txt
