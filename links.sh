#!/bin/sh

utils/create_pages.py lectures.txt utils/LectureTempl.html | utils/add_level.awk -v tag=h3 > links.txt
