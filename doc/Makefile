all: doxygen.stamp
html:
	mkdir -p $@
latex:
	mkdir -p $@
doxygen.stamp: doxyfile html latex
	cat doxyfile | \
	  sed 's/ENABLED_SECTIONS *=/ENABLED_SECTIONS  = Japanese/g' |\
	  sed 's!PROJECT_NAME *=!PROJECT_NAME = "Doxygen Model Template"!g' |\
	  sed 's/=LANG=/ja/g'  |\
	  doxygen -
	@echo "copy mathjax components"
	cat doxyfile | \
	  sed 's/ENABLED_SECTIONS *=/ENABLED_SECTIONS  = English/g' |\
	  sed 's!PROJECT_NAME *=!PROJECT_NAME = "Doygen Model Template"!g' |\
	  sed 's/=LANG=/en/g'  |\
	  doxygen -
	@echo "post processing: github issue #6901: https://github.com/doxygen/doxygen/issues/6901"
	find html -name \*.html | \
	xargs sed -i -e 's|cf05388f2679ee054f2beb29a391d25f4e673ac3|d3d9a9a6595521f9666a5e94cc830dab83b65699|g' \
	  -e 's|gpl-2\.0\.txt GPL-v2|expat\.txt MIT|g'
	@touch $@
html-local: doxygen.stamp
update-local:
	-@rm -fr doxygen.stamp
	$(MAKE) html-local

clean:
	-@rm -fr html
	-@rm -fr latex
	-@rm -fr doxygen.stamp
