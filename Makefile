FC=gfortran
LD=gfortran 
FFLAGS=
PGPLOT_HOME=/usr/local/pgplot
LDFLAGS=-Wl,-rpath,$(PGPLOT_HOME)  -L$(PGPLOT_HOME)
LIBS=-lpgplot -lpng -lX11
RM=rm -f
.PHONY: all clean article
all: plot1 plot2 plot3 writepoints points

plot1.o: plot1.f
	$(FC) -c $<
plot1: plot1.o
	$(LD) $< -o $@ $(LDFLAGS) $(LIBS)
plot2.o: plot2.f
	$(FC) -c $<
plot2: plot2.o
	$(LD) $< -o $@ $(LDFLAGS) $(LIBS)
plot3.o: plot3.f
	$(FC) -c $<
writepoints.o: writepoints.f
	$(FC) -c $<
points.o: points.f
	$(FC) -c $<
writepoints: writepoints.o
	$(LD) $< -o $@
points: points.o
	$(LD) $< -o $@
plot3: plot3.o
	$(LD) $< -o $@ $(LDFLAGS) $(LIBS)

clean:
	$(RM) *.o plot1 plot2 plot3 writepoints points article.aux  article.dvi  article.log  article.pdf  article.ps pgplot.aux pgplot.log pgplot.ps
article:
	latex article
	dvips article.dvi
	ps2pdf article.ps
