QINCS = $(shell ls quiz*.txt | sed -e 's/txt/qhtm/g')
QUIZZES = $(shell ls quiz*.txt)

all: $(QINCS)

%.qhtm: %.txt
	../utils/quiz2html.py $< >$@
