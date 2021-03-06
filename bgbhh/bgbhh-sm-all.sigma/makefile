# --- variables defined by configure ---

SRC = .
PREFIX = x86_64-Linux
LIBDIRSUFFIX = 64

EXE = 
DEF = -D

LT = ../LoopTools-2.14/build
NINJA = 
SAMURAI = 
CT = 
FH = 
LHAPDF = /usr/local/lib
INCPATH = $(LT)
STDLIBS = $(LHAPDF)/libLHAPDF.a $(LT)/libooptools.a -lstdc++ 
LDFLAGS = -L/usr/lib/gcc/x86_64-linux-gnu/7/liblto_plugin.so -L/usr/lib/gcc/x86_64-linux-gnu/7 -L/usr/lib/gcc/x86_64-linux-gnu/7/../../../x86_64-linux-gnu -L/usr/lib/gcc/x86_64-linux-gnu/7/../../../../lib -L/lib/x86_64-linux-gnu -L/lib/../lib -L/usr/lib/x86_64-linux-gnu -L/usr/lib/../lib -L/usr/lib/gcc/x86_64-linux-gnu/7/../../.. -lgfortran -lm -lgcc_s -lgcc -lquadmath -lm -lgcc_s -lgcc -lgcc_s -lgcc

FC = gfortran
FFLAGS = -O3 -march=native -g -ffixed-line-length-none $(DEF)U77EXT=0

CC = gcc
CFLAGS = -O3 -fomit-frame-pointer -ffast-math -march=native -m64 -g -std=gnu99 

CXX = g++
CXXFLAGS = -m64 

MCFLAGS = -b64
MCLIBS = -lpthread

# --- end defs by configure ---


# makefile.in
# makefile template used by configure
# this file is part of FormCalc
# last modified 1 Jul 16 th

# Note: make permanent changes only in makefile.in,
# changes in makefile will be overwritten by configure.


.PHONY: all build clean distclean

MAKECMDGOALS ?= run

MAKECMDGOALS := $(MAKECMDGOALS:%=%$(EXE))

LEFTOVERS := $(wildcard [b]uild)

all: $(LEFTOVERS) $(MAKECMDGOALS)

AR = $(SRC)/tools/ar
RANLIB = $(SRC)/tools/ranlib

DIR = $(dir $(lastword $(MAKEFILE_LIST)))
LIB = $(subst /,_,$(patsubst $(SRC)/%,%,$(DIR:/=))).a
LIBS :=
INCS :=
VPATH := .:$(SRC):$(SRC)/include

-include $(SRC)/renconst/*akefile

-include $(SRC)/squaredme/*akefile $(SRC)/squaredme/*/*akefile

CLEANLIBS := $(LIBS)

-include $(SRC)/util/*akefile

libs: $(LIBS)
	$(RANLIB)

build:
	$(RANLIB)


INCLUDE := $(patsubst %,-I%,$(subst :, ,$(VPATH):$(INCPATH)))
FINCLUDE := -I$(SRC)/F $(INCLUDE)
CINCLUDE := -I$(SRC)/C $(INCLUDE)

FFLAGS += $(FINCLUDE)
CFLAGS += $(CINCLUDE)

ifdef DEBUG
FFLAGS += -g $(DEF)DEBUG=$(DEBUG)
CFLAGS += -g -DDEBUG=$(DEBUG)
endif

export FC
export FFLAGS
export CC
export CFLAGS


DEPS := $(wildcard *.d)

clean:
	$(RM) -r build
	$(RM) $(DEPS) $(DEPS:%.d=%.tm) $(DEPS:%.d=%.tm.c) \
	  $(DEPS:%.d=%.o) $(DEPS:%.d=%$(EXE)) $(CLEANLIBS) libs

distclean: clean
	$(RM) $(LIBS) makefile simd.h


-include [FC]-squaredme.d
-include [FC]-renconst.d

F-%.d: deps-%.c
	$(CPP) -MM $(FINCLUDE) $< | sed 's|^.*:|$@:|' > $@

C-%.d: deps-%.c
	$(CPP) -MM $(CINCLUDE) $< | sed 's|^.*:|$@:|' > $@


-include $(MAKECMDGOALS:%$(EXE)=%.d)
%.d: $(SRC)/%.F
	{ grep "^[^c*].*Mma" $< >/dev/null 2>&1 ; \
	  echo "MMA = $$?" ; \
	  echo "$*$(EXE): $@ libs" ; \
	  $(CPP) -M $(FINCLUDE) -x c $< | sed 's|^.*:|$@:|' ; \
	} > $@

PREFIX :=

ifeq ($(MMA), 0)
%$(EXE):: $(SRC)/%.F %.d $(SRC)/tools/mktm
	$(FC) $(FFLAGS) $(DEF)MMA $(DEF)PREFIX=$(PREFIX) -E $< | $(SRC)/tools/mktm $*.tm
	$(FC) $(FFLAGS) $(DEF)MMA $(DEF)PREFIX=$(PREFIX) -c $<
	CC="$(SRC)/tools/fcc" REALCC="$(CC) $(CFLAGS)" \
	CXX="$(SRC)/tools/f++" REALCXX="$(CXX) $(CXXFLAGS)" \
	  PATH="$(PATH):$(SRC)/tools" \
	  mcc $(MCFLAGS) -o $@ $*.tm $*.o $(LIBS) $(STDLIBS) $(LDFLAGS) $(MCLIBS)
	-$(RM) $*.o $*.tm.c
else
%$(EXE):: $(SRC)/%.F %.d
	$(FC) $(FFLAGS) $(DEF)PREFIX=$(PREFIX) -o $@ $< $(LIBS) $(STDLIBS)
	-$(RM) $*.o
endif

