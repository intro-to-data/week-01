# Weekly Lecture Makefile
# Targets: data, lecture

# Variables --------------------------------------------------------------------
LECTURE = lecture.html
LAB = lab.html
CLASS_GRADES = data/class_grades.xlsx
ZIP = Week\ 01.zip


# Data Tasks ------------------------------------------------------------------=
$(CLASS_GRADES): data/class_grades.R
	Rscript $<


# Lecture Tasks ----------------------------------------------------------------
$(LECTURE): lecture.qmd $(CLASS_GRADES)
	quarto preview $<


# Phony ------------------------------------------------------------------------
data: $(CLASS_GRADES)
lecture: $(LECTURE)
all: data lecture

style: $(LECTURE) ($(LAB) $(CLASS_GRADES)
	Rscript -e "styler::style_dir('.'); styler::style_dir('data/')"

zip: zip.R $(LECTURE) $(LAB) $(CLASS_GRADES)
	Rscript $<

clean:
	rm data/*.xlsx data/*.csv

.PHONY: all clean data lecture style zip
