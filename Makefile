GIT_SRC=https://github.com/CSSEGISandData/COVID-19.git

all: create 

create: 
	$(if ${OUT_FILE}, $(eval FN=${OUT_FILE}), $(eval FN=covid-$(shell date -u +%Y%m%d%H%M).html) )
	@echo Generating update to ${FN}

	# update
	test -s COVID-19 || git clone ${GIT_SRC}
	git -C COVID-19 pull

	# generate
	jupyter-nbconvert --execute --to html --output ${FN} --no-input covid.ipynb

clean_html:
	rm -f covid*.html

clean: clean_html
