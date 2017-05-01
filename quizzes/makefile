QINCS = $(shell ls quiz*.txt | sed -e 's/txt/qhtm/g')
QUIZZES = $(shell ls quiz*.txt)

%.qhtm: %.txt
	../utils/quiz2html.py $< >$@

all: $(QINCS)

clean:
	touch *.txt
