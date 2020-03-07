GIT_SRC=https://github.com/CSSEGISandData/COVID-19.git

all: create 

create: 
	$(eval DATE=$(shell date -u +%Y%m%d%H%M))
	$(eval FN=$(shell echo covid-${DATE}.html))

	# update
	test -s COVID-19 || git clone ${GIT_SRC}
	git -C COVID-19 pull

	# generate
	jupyter-nbconvert --execute --to html --output ${FN} --no-input covid.ipynb

clean_html:
	rm -f covid*.html

clean_all: clean_html
