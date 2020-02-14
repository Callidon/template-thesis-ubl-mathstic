# template-thesis-ubl-mathstic
Thesis template for the Université Bretagne Loire, under MathSTIC doctoral school

# Getting started
```
git clone https://github.com/Callidon/template-thesis-ubl-mathstic.git
mv template-thesis-ubl-mathstic my-thesis
cd my-thesis
make
```

# Instructions

The `make` command autodetects which LaTeX compilation steps must be run (pdflatex, bibtex, makeindex, etc).

The main file to edit is `thesis.tex`, which contains all the macros for typesetting the cover and bacpage of the thesis.
It is based on the [`memoir` class](http://texdoc.net/texmf-dist/doc/latex/memoir/memman.pdf), and will generate a thesis compliant with the MathSTIC doctoral school standards.
Beyond that, you are free to modifiy the template as you like, to write your own personal thesis :smile:
