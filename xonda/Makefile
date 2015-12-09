FC=gfortran

FFLAGS = -O3

LNK=gfortran

# Aqui solo se ponen las subroutinas
OBJS = main.o memory.o initial.o grid.o evolve.o save1D.o RK3.o rhs.o boundaries.o exacta.o save0D.o calc_constriction.o

#Aqui van los modulos
MODS = global_numbers.o arrays.o 

all: ondauv 

$(OBJS):	$(MODS)

ondauv:	$(OBJS) $(MODS)
		$(LNK) $(FFLAGS) -o xonda $(OBJS) $(MODS) 
	@ mkdir -p EO
	@ mv xonda EO

.PHONY:	clean

clean:
	-rm -f *.o *.mod EO/xonda EO/*.x EO/*.tl

%.o : %.f90
	$(FC) -c $(FFLAGS) $< -o $@
