#                           -------------------------------------
#                           Dynamic all-pairs shortest paths experimental package (dsp-1.0)
#                           Makefile (c) 2002-2003 Camil Demetrescu
#                           All rights reserved.
#                           Last changed:   $Date: 2003/05/15 22:00:55 $
#                           Changed by:     $Author: demetres $
#                           Revision:       $Revision: 1.6 $

#                           -------------------------------------

#                           -------------------------------------
#                           Macros
#                           -------------------------------------
LL_PATH =                   ../ll/
C  =                        gcc -I$(LL_PATH)include -Iinclude -I../include -o dsp
LL =                        $(LL_PATH)src/core/common/*.c $(LL_PATH)src/core/posix/*.c

#                           -------------------------------------
#                           Rules
#                           -------------------------------------

.PHONY: all debug clean pack

all:
	                        cd bin; $(C) -O4 $(LL) ../src/*.c -lm

debug:
	                        cd bin; $(C) -O0 -g -fbuiltin -Wall -Wextra $(LL) ../src/*.c -lm

clean:
	                        cd bin; rm -f *

pack:
	                        $(MAKE) clean; cd ..; tar cf dsp-1.0.tar dsp-1.0; gzip dsp-1.0.tar

