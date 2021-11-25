OUT = output
PAGES = pages
IMAGES = images
BIB = documentRef.bib
TEX = document.tex
PROJ = document
TEMPLATE = template

BLANK :=
SLASH = \$(BLANK)

CLEAN_DIRS  = $(OUT) $(PAGES) .

.PHONY : clean
clean : 
	@ -$(foreach dir, $(CLEAN_DIRS) , rm -f $(dir)/*.swp         )
	@ -$(foreach dir, $(CLEAN_DIRS) , rm -f $(dir)/*.aux         )
	@ -$(foreach dir, $(CLEAN_DIRS) , rm -f $(dir)/*.bbl         )
	@ -$(foreach dir, $(CLEAN_DIRS) , rm -f $(dir)/*.blg         )
	@ -$(foreach dir, $(CLEAN_DIRS) , rm -f $(dir)/*.fdb_latexmk )
	@ -$(foreach dir, $(CLEAN_DIRS) , rm -f $(dir)/*.fls         )
	@ -$(foreach dir, $(CLEAN_DIRS) , rm -f $(dir)/*.log         )
	@ -$(foreach dir, $(CLEAN_DIRS) , rm -f $(dir)/*.out         )
	@ -$(foreach dir, $(CLEAN_DIRS) , rm -f $(dir)/*.pdf         )
	@ -$(foreach dir, $(CLEAN_DIRS) , rm -f $(dir)/*.gz          )
	@ -$(foreach dir, $(CLEAN_DIRS) , rm -f $(dir)/*.toc         )
	@ -$(foreach dir, $(CLEAN_DIRS) , rm -f $(dir)/*.glo         )
	@ -$(foreach dir, $(CLEAN_DIRS) , rm -f $(dir)/*.glsdefs     )
	@ -$(foreach dir, $(CLEAN_DIRS) , rm -f $(dir)/*.glsist      )
	@ -$(foreach dir, $(CLEAN_DIRS) , rm -f $(dir)/*.ist         )
	@ -$(foreach dir, $(CLEAN_DIRS) , rm -f $(dir)/*.odt         )
	@ -$(foreach dir, $(CLEAN_DIRS) , rm -f $(dir)/*.4ct         )
	@ -$(foreach dir, $(CLEAN_DIRS) , rm -f $(dir)/*.4tc         )
	@ -$(foreach dir, $(CLEAN_DIRS) , rm -f $(dir)/*.bcf         )
	@ -$(foreach dir, $(CLEAN_DIRS) , rm -f $(dir)/*.dvi         )
	@ -$(foreach dir, $(CLEAN_DIRS) , rm -f $(dir)/*.idv         )
	@ -$(foreach dir, $(CLEAN_DIRS) , rm -f $(dir)/*.lg          )
	@ -$(foreach dir, $(CLEAN_DIRS) , rm -f $(dir)/*.tmp         )
	@ -$(foreach dir, $(CLEAN_DIRS) , rm -f $(dir)/*.xref        )
	@ -rm -r $(OUT) || true 
	@ -mkdir $(OUT)


# example usage: 
# for a custom name:
# 	make NAME=custom rename
# for the default name:
# 	make rename
.PHONY : rename
rename:
	-mv $(PROJ).docx $(NAME).docx
	-mv $(PROJ).pdf $(NAME).pdf

# example usage:
# 	make PAGE=2020-12-07 convertMD
# without PAGE=prefix, it will prompt for a filename
.PHONY : convertMD
convertMD:
	mkdir -p ${OUT}
	mkdir -p ${OUT}/${OUT}
	cp ${TEX} ${OUT}
	cp ${BIB} ${OUT}/${OUT}
	cp -r $(PAGES) $(OUT)
	cp -r $(IMAGES) $(OUT)
	cp -r ${TEMPLATE} $(OUT)

	@# explain why syntax is differet inside a loop
	@# does that make sense?
	@for PAGE in $(shell ls ${PAGES}/*.md); \
		do \
			BASE="`basename ${PAGES}/$${PAGE} .md`"; \
			FROM=$${BASE}.md; \
			TO=$${BASE}.tex; \
			cat template/page-header-footer/head.tex > ${OUT}/${PAGES}/$${TO}; \
			pandoc -f markdown -t latex ${PAGES}/$${FROM} >> ${OUT}/${PAGES}/$${TO}; \
			cat template/page-header-footer/tail.tex >> ${OUT}/${PAGES}/$${TO}; \
		done

.PHONY : pdf
pdf:
	make convertMD
	cd $(OUT) && pdflatex --shell-escape -output-directory $(OUT) $(TEX)
	cd $(OUT)/$(OUT) && biber $(PROJ) 
	cd $(OUT) && pdflatex --shell-escape -output-directory $(OUT) $(TEX) 
	cp $(OUT)/$(OUT)/*pdf .

# generate report from one meeting, in pdf format
#
# example usage:
# 	make PAGE=2020-12-07 page
# without PAGE=prefix, it will prompt for a filename
# more verbose alternative 
#	$(eval CHAP := $(shell cat ${TEX} | grep ^\\\\subfile{.*tex} | nl | grep ${PAGE} | cut -f 1 | grep -oP [0-9]+))
#
# left as an exercise: add citetitle support
# (hint: check page-word target for inspiration)
.PHONY : page
page:
	make convertMD
	$(eval TMPFILE := TEMP_${PAGE})
	echo ${TMPFILE}

	$(eval CHAP := $(shell cat ${TEX} | grep subfile{.*tex} | grep -v % | nl | grep ${PAGE} | cut -f 1 | grep -oP [0-9]+))
	$(eval CHAP := $(shell expr ${CHAP} - 1))
	$(eval CHAP := $(if $(CHAP),$(CHAP),0))
	cd ${OUT} && echo "\AtBeginDocument{\setcounter{chapter}{${CHAP}}}" > ${PAGES}/${TMPFILE}.tex
	cd ${OUT} && cat ${PAGES}/${PAGE}.tex >> ${PAGES}/${TMPFILE}.tex
	cd ${OUT} && cat ${PAGES}/${TMPFILE}.tex > ${PAGES}/${PAGE}.tex

	cd ${OUT} && pdflatex --shell-escape -output-directory $(OUT) ${PAGES}/${PAGE}.tex 
	cd ${OUT}/${OUT} && biber $(PAGE) 
	cd ${OUT} && pdflatex --shell-escape -output-directory $(OUT) ${PAGES}/${PAGE}.tex 
	cp ${OUT}/${OUT}/${PAGE}.pdf .


# generate entire document in docx format
# \citetitle isn't supported in Pandoc, so use Python to do some magic
.PHONY : word
word:
	make convertMD
	cp ${BIB} ${OUT}
#	for f1 in $(shell ls ${PAGES} | grep -E ^[0-9]{4}-[0-9]{2}-[0-9]{2}.tex | cut -d . -f 1); do python ${TEMPLATE}/citeTitle.py ${PAGES}/$${f1}; done
	cd ${OUT} && pandoc \
		--toc \
		-N \
		-V documentclass=memoir \
		-f latex \
		-t docx \
		--lua-filter ${TEMPLATE}/my-pagebreak.lua \
		$(TEX) \
		-o ${OUT}/${PROJ}.docx \
		--metadata link-citations=true \
		--metadata backtick_code_blocks=true \
		--metadata reference-section-title=Bibliography \
		--biblio=$(BIB) \
		--citeproc 
#		--reference-doc=template/word/UoAThesisTemplate-UnNumbered.dotm
	cp $(OUT)/$(OUT)/$(PROJ).docx .


# generate one subfile, in docx format
# section numbering not supported (must create filter to number top level sections properly)
#
# example usage:
# 	make PAGE=2020-12-07 page-word
page-word:
	make convertMD
	cp ${BIB} ${OUT}
	cd ${OUT} && cp ${PAGES}/${PAGE}.tex ${OUT}/${PAGE}.tex
#	cd ${OUT} && python ${TEMPLATE}/citeTitle.py ${PAGE}
	cd ${OUT} && pandoc \
		${OUT}/${PAGE}.tex \
		-o ${OUT}/${PAGE}.docx \
		--metadata link-citations=true \
		--metadata backtick_code_blocks=true \
		--metadata reference-section-title=Bibliography \
		--biblio=$(BIB) \
		--citeproc 
#		--reference-doc=template/word/UoAThesisTemplate-UnNumbered.dotm
	cp $(OUT)/$(OUT)/${PAGE}.docx .

# Create a new .tex file in the pages directory, 
# intended to be imported as a subfile for the main tex document.
# example usage to generate hello.tex:
# 	make PAGE=hello page
# without PAGE=name, it will use today's date in YYYY-MM-DD formatnew
# example usage generating today's date:
# 	make page
#
# read more here:
# https://newbedev.com/how-to-conditionally-set-makefile-variable-to-something-if-it-is-empty
.PHONY : newpage
newpage:
	$(eval TODAY := $(if $(PAGE),$(PAGE),$(shell date +%Y-%m-%d)))

	touch $(PAGES)/$(TODAY).tex
	cat template/page-header-footer/head.tex > $(PAGES)/$(TODAY).tex;
	cat template/page-header-footer/pagestart.tex >> $(PAGES)/$(TODAY).tex;
	echo {$(TODAY)} >> $(PAGES)/$(TODAY).tex;
	cat template/page-header-footer/tail.tex >> $(PAGES)/$(TODAY).tex;

# requires installation of bibutils
# http://bibutils.refbase.org
.PHONY : endnote
endnote:
	bib2xml $(BIB) | xml2end > ${OUT}/citations.enw

.PHONY : ool
ool:
	make convertMD
	cd $(OUT) && pandoc $(TEX) --biblio=$(OUT)/$(BIB) -o $(OUT)/$(PROJ).odt --citeproc
	cp $(OUT)/$(OUT)/${PROJ}.odt .
