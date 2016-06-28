
#
# This file is part of the `robfrawley/latex-resume` project
#
# (c) Rob M Frawley 2nd <rmf@src.run>
#
# For the full copyright and license information, please view the LICENSE.md
# file that was distributed with this source code.
#

SELF_FILE := $(lastword $(MAKEFILE_LIST))

# bin/file paths, remotes, and deps
INT_SR_DOCCLASS = ./include/_document.cls
EXT_FA_CLASS_STY = ./external/font-font-awesome/fontawesome.sty
EXT_FA_FONT_RAW = "https://github.com/FortAwesome/Font-Awesome/blob/master/fonts/FontAwesome.otf?raw=true"
EXT_FA_FONT_OTF = ./external/font-font-awesome/FontAwesome.otf
EXT_FA_MAKESTY_BIN = ./external/fa-make-tex-style/fa-make-tex-style
EXT_FA_MAKESTY_OPT = build -p latex-cv
EXT_FA_MAKESTY_APT = ruby

# are required packages installed?
EXT_FA_MAKESTY_APT_OKAY != dpkg -l | grep -P "^ii  (ruby)\s" | wc -l

# binary path to latex->pdf executable
BIN_LATEX2PDF != which xelatex

# file list of .tex files
FILES_BLD_INPUT_FLIST != find . -type f -prune -print | grep -P template/\.\*\.tex$

# file list of coverletter .tex files
FILES_BLD_INPUT_FLIST_COVERLETTER != find . -type f -prune -print | grep -P template/coverletter

# file list of resume .tex files
FILES_BLD_INPUT_FLIST_RESUME != find . -type f -prune -print | grep -P template/resume

# file list of complete .tex files
FILES_BLD_INPUT_FLIST_COMPLETE != find . -type f -prune -print | grep -P template/complete

# file list of .log files
FILES_BLD_LOG_FLIST != find . -type f -prune -name "*.log" -print

# file list of .out files
FILES_BLD_OUT_FLIST != find . -type f -prune -name "*.out" -print

# file list of .aux files
FILES_BLD_AUX_FLIST != find . -type f -prune -name "*.aux" -print

# file list of .pdf files
FILES_BLD_PDF_FLIST != find . -type f -prune -name "*.pdf" -print

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
	for f in $(FILES_BLD_LOG_FLIST); do if [ -f "$$f" ]; then rm "$$f"; fi done
	for f in $(FILES_BLD_AUX_FLIST); do if [ -f "$$f" ]; then rm "$$f"; fi done
	for f in $(FILES_BLD_OUT_FLIST); do if [ -f "$$f" ]; then rm "$$f"; fi done


#
# target: clean-pre-rm-temporary-links
#
clean-pre-rm-temporary-links:
	for f in $(FILES_BLD_LNS_FLIST); do if [ -f "$$f" ]; then rm "$$f"; fi done


#
# target: clean-final-build-files
#
clean-pre-rm-final-files:
	for f in $(FILES_BLD_PDF_FLIST); do if [ -f "$$f" ]; then rm "$$f"; fi done


#
# target: clean-post
#
clean-post: clean-post-mv-logs clean-post-rm-temporary-files


#
# target: move-logs-mv-logs
#
clean-post-mv-logs:
	mkdir -p var
	for f in $(FILES_BLD_LOG_FLIST); do if [ -f "$$f" ]; then mv "$$f" "./var/"; fi done


#
# target: clean-post-rm-temporary-files
#
clean-post-rm-temporary-files:
	for f in $(FILES_BLD_AUX_FLIST); do if [ -f "$$f" ]; then rm "$$f"; fi done
	for f in $(FILES_BLD_OUT_FLIST); do if [ -f "$$f" ]; then rm "$$f"; fi done


#
# target: install
#
install: install-remote-files install-system-packages install-fontawesome-sty install-symbolic-links


#
# target: install-external-files
#
install-remote-files:
	curl -sS -L --raw --output $(EXT_FA_FONT_OTF) $(EXT_FA_FONT_RAW)


#
# target: install-system-env
#
install-system-packages:
	if [ $(EXT_FA_MAKESTY_APT_OKAY) -ne 1 ]; then sudo apt-get install -qq "$(EXT_FA_MAKESTY_APT)"; fi
	if [ $(EXT_FA_MAKESTY_APT_OKAY) -eq 1 ]; then echo "Required packages already installed: $(EXT_FA_MAKESTY_APT)"; fi


#
# target: install-fontawesome-sty
#
install-fontawesome-sty:
	if [ -f $(EXT_FA_CLASS_STY) ]; then rm $(EXT_FA_CLASS_STY); fi
	$(EXT_FA_MAKESTY_BIN) $(EXT_FA_MAKESTY_OPT)
	mv fontawesome.sty "$(EXT_FA_CLASS_STY)"


#
# target: install-root-symbolic-links
#
install-symbolic-links: clean-pre-rm-temporary-links
	if [ ! \( -f "FontAwesome.sty" \) ]; then ln -s $(EXT_FA_CLASS_STY) FontAwesome.sty; fi
	if [ ! \( -f "FontAwesome.otf" \) ]; then ln -s $(EXT_FA_FONT_OTF) FontAwesome.otf; fi
	if [ ! \( -f "srcv.cls" \) ]; then ln -s $(INT_SR_DOCCLASS) srcv.cls; fi


# EOF
