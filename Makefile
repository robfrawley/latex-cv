
#
# This file is part of the `src-run-cv` project
#
# (c) Rob M Frawley 2nd <rmf@src.run>
#
# For the full copyright and license information, please view the LICENSE.md
# file that was distributed with this source code.
#

SELF_FILE := $(lastword $(MAKEFILE_LIST))

# bin/file paths, remotes, and deps
INT_SR_DOCCLASS = "include/srcv-inc-docclass.cls"
EXT_FA_CLASS_STY = "external/font-font-awesome/fontawesome.sty"
EXT_FA_FONT_RAW = "https://github.com/FortAwesome/Font-Awesome/blob/master/fonts/FontAwesome.otf?raw=true"
EXT_FA_FONT_OTF = "external/font-font-awesome/FontAwesome.otf"
EXT_FA_MAKESTY_RAW = "https://github.com/posquit0/latex-fontawesome/blob/master/makesty.py?raw=true"
EXT_FA_MAKESTY_BIN = "external/font-font-awesome/makesty.py"
EXT_FA_MAKESTY_APT = "python3 python-pip python3-pip python-dev python-bs4"

# are required packages installed?
EXT_FA_MAKESTY_APT_OKAY != dpkg -l | grep -P "^ii  (python3|python-pip|python3-pip|python-dev|python-bs4)\s" | wc -l

# binary path to latex->pdf executable
BIN_LATEX2PDF != which xelatex

# file list of .tex files
FILES_BLD_INPUT_FLIST != find . -type f -prune -print | grep -P template/srcv-tpl\.\*\.tex$

# file list of coverletter .tex files
FILES_BLD_INPUT_FLIST_COVERLETTER != find . -type f -prune -print | grep -P template/srcv-tpl\.\*\.tex$ | grep tpl-coverletter

# file list of resume .tex files
FILES_BLD_INPUT_FLIST_RESUME != find . -type f -prune -print | grep -P template/srcv-tpl\.\*\.tex$ | grep tpl-resume

# file list of complete .tex files
FILES_BLD_INPUT_FLIST_COMPLETE != find . -type f -prune -print | grep -P template/srcv-tpl\.\*\.tex$ | grep tpl-complete

# file list of .log files
FILES_BLD_LOG_FLIST != find . -type f -prune -print | grep -P .*\.log$

# file list of .out files
FILES_BLD_OUT_FLIST != find . -type f -prune -print | grep -P .*\.out$

# file list of .pdf files
FILES_BLD_PDF_FLIST != find . -type f -prune -print | grep -P .*\.pdf$

# file list of symbolic link files
FILES_BLD_LNS_FLIST != find . -type l -prune -print


#
# target: pdf
#
pdf: pdf-all


#
# target: pdf-all
#
pdf-all: clean install build-all clean-post


#
# target: pdf-coverletter
#
pdf-coverletter: clean install build-coverletter clean-post


#
# target: pdf-resume
#
pdf-resume: clean install build-resume clean-post


#
# target: pdf-complete
#
pdf-complete: clean install build-complete clean-post


#
# target: build-all
#
build-all:
	for f in $(FILES_BLD_INPUT_FLIST); do $(BIN_LATEX2PDF) --halt-on-error --interaction=nonstopmode --shell-restricted "$$f"; done


#
# target: build-coverletter
#
build-coverletter:
	for f in $(FILES_BLD_INPUT_FLIST_COVERLETTER); do $(BIN_LATEX2PDF) --halt-on-error --interaction=nonstopmode --shell-restricted "$$f"; done


#
# target: build-resume
#
build-resume:
	for f in $(FILES_BLD_INPUT_FLIST_RESUME); do $(BIN_LATEX2PDF) --halt-on-error --interaction=nonstopmode --shell-restricted "$$f"; done


#
# target: build-complete
#
build-complete:
	for f in $(FILES_BLD_INPUT_FLIST_COMPLETE); do $(BIN_LATEX2PDF) --halt-on-error --interaction=nonstopmode --shell-restricted "$$f"; done


#
# target: clean
#
clean: clean-pre clean-post


#
# target: clean-pre
#
clean-pre: clean-pre-rm-temporary-files clean-pre-rm-temporary-links clean-pre-rm-final-files


#
# target: clean-pre-rm-temporary-files
#
clean-pre-rm-temporary-files:
	for f in $(FILES_BLD_LOG_FLIST); do rm "$$f"; done
	for f in $(FILES_BLD_OUT_FLIST); do rm "$$f"; done


#
# target: clean-pre-rm-temporary-links
#
clean-pre-rm-temporary-links:
	for f in $(FILES_BLD_LNS_FLIST); do rm "$$f"; done


#
# target: clean-final-build-files
#
clean-pre-rm-final-files:
	for f in $(FILES_BLD_PDF_FLIST); do rm "$$f"; done


#
# target: clean-post
#
clean-post: clean-post-mv-logs


#
# target: move-logs-mv-logs
#
clean-post-mv-logs:
	mkdir -p var
	for f in $(FILES_BLD_LOG_FLIST); do if [[ -f "$$f" ]]; then mv "$$f" "var/"; fi done


#
# target: install
#
install: install-remote-files install-apt-packages install-python-style-generator install-root-symbolic-links


#
# target: install-external-files
#
install-remote-files:
	curl -sS -L --raw --output $(EXT_FA_FONT_OTF) $(EXT_FA_FONT_RAW)
	#curl -sS -L --raw --output $(EXT_FA_MAKESTY_BIN) $(EXT_FA_MAKESTY_RAW)


#
# target: install-system-env
#
install-apt-packages:
	if [[ $(EXT_FA_MAKESTY_APT_OKAY) -ne 5 ]]; then sudo apt-get install -qq "$(EXT_FA_MAKESTY_APT)"; fi
	if [[ $(EXT_FA_MAKESTY_APT_OKAY) -eq 5 ]]; then echo "Required packages already installed: $(EXT_FA_MAKESTY_APT)"; fi


#
# target: install-python-style-generator
#
install-python-style-generator:
	python $(EXT_FA_MAKESTY_BIN)
	cp fontawesome.sty include/srcv-inc-fontawesome.sty
	mv fontawesome.sty external/font-font-awesome/srcv-inc-fontawesome.sty


#
# target: install-root-symbolic-links
#
install-root-symbolic-links: clean-pre-rm-temporary-links
	if [ ! \( -f "FontAwesome.sty" \) ]; then ln -s $(EXT_FA_CLASS_STY) FontAwesome.sty; fi
	if [ ! \( -f "FontAwesome.otf" \) ]; then ln -s $(EXT_FA_FONT_OTF) FontAwesome.otf; fi
	if [ ! \( -f "srcv.cls" \) ]; then ln -s $(INT_SR_DOCCLASS) srcv.cls; fi


# EOF
