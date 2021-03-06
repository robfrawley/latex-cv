#
# This file is part of the `latex-cv` project.
#
# (c) Rob M Frawley 2nd <rmf@src.run>
# (c) Claud D. Park <posquit0.bj@gmail.com>
#
# For the full copyright and license information, please view the LICENSE.md
# file that was distributed with this source code.
# Class license:
# LPPL v1.3c (http://www.latex-project.org/lppl)
#

build:
	cd rmf/ ; for f in cv.tex coverletter.tex combined.tex; do xelatex $$f; done
