
MAIN = oslab-thesis
PRES = presentation

all:    pdf

pdf:    clean_aux
	xelatex $(MAIN)
	bibtex $(MAIN)
	xelatex $(MAIN)
	xelatex $(MAIN)
#	makeindex $(MAIN).nlo -s nomencl.ist -o $(MAIN).nls
#	xelatex $(MAIN)

tgz:    
	tar -zcvf $(MAIN).tgz *tex Makefile *pdf chapters images extra

clean_aux:
	rm -f *.aux
clean:
	rm -f *.aux *.bbl *.blg *.log *~ \#*\# *.toc *.dvi *.idx *.lof *.nlo *.out *.ps *.lot *.lol *.tgz *.nav *.snm *.ent

presentation:
	xelatex $(PRES)
	xelatex $(PRES)
	dvips -Ppdf -G0 $(PRES) -o
	ps2pdf $(PRES).ps $(PRES).pdf

print:
	lpr -o media=A4 $(MAIN).printed.ps
