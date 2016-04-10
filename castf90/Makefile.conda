PREFIX ?= $(CONDA_ENV_PATH)
INSTALL_PREFIX = $(PREFIX)
INCLUDEPATH = $(PREFIX)/include
LIBPATH = $(PREFIX)/lib
LDFLAGS = -Wl,-rpath $(LIBPATH)
OPT_LIBS = -lhdf5 -lhdf5_hl -lnetcdf
LIBS = $(OPT_LIBS) -lnetcdff -lopenblas -llapack95

COMPILE = gfortran -c -O2 -fbacktrace -Warray-bounds -fopenmp -ffree-line-length-0
LINK = gfortran -Warray-bounds -Wall -fopenmp -O2 -o

CASTF90_HOME = $(INSTALL_PREFIX)/opt/castf90

PROGRAM = analogue.out
prog.f90 = analogue.f90
prog.o = analogue.o

.PHONY: all
all: $(PROGRAM) 

config.o: config.f90
	$(COMPILE) config.f90 -I$(INCLUDEPATH)
config.mod: config.o
	@true
	
eofs.o: eofs.f90
	$(COMPILE) eofs.f90 -I$(INCLUDEPATH)
eofs.mod: eofs.o
	@true
	
read.o: read.f90
	$(COMPILE) read.f90 -I$(INCLUDEPATH)
read.mod: read.o
	@true
	
distance.o: distance.f90
	$(COMPILE) distance.f90 -I$(INCLUDEPATH)
distance.mod: distance.o
	@true

routines.o: routines.f90 read.mod distance.mod
	$(COMPILE) routines.f90 -I$(INCLUDEPATH)
routines.mod: routines.o
	@true

# analogues	
$(prog.o): config.mod routines.mod eofs.mod $(prog.f90)
	$(COMPILE) $(prog.f90) -I$(INCLUDEPATH)

$(PROGRAM): $(prog.o) config.o read.o distance.o routines.o eofs.o
	$(LINK) $(PROGRAM) read.o config.o distance.o routines.o eofs.o $(prog.o) -I$(INCLUDEPATH) -L$(LIBPATH) $(LDFLAGS) $(LIBS)

.PHONY: install
install: all
	cp $(PROGRAM) $(INSTALL_PREFIX)/bin
	mkdir -p $(CASTF90_HOME)
	cp *.sh *.pdf pbsscript $(CASTF90_HOME)

.PHONY: uninstall
uninstall:
	rm -f $(INSTALL_PREFIX)/bin/$(PROGRAM)
	rm -rf $(CASTF90_HOME)

.PHONY: clean
clean:
	rm -f $(PROGRAM) *.mod *.o *.a
