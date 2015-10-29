#a Copyright
#  
#  This file 'Makefile' copyright Gavin J Stark 2003, 2004
#  
#  This program is free software; you can redistribute it and/or modify it under
#  the terms of the GNU General Public License as published by the Free Software
#  Foundation, version 2.0.
#  
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even implied warranty of MERCHANTABILITY
#  or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
#  for more details.

#a Global variables
CYCLICITY := $(CYCLICITY_ROOT)

DEBUG_BUILD:="no"
OPTIMIZE := "yes"

CDL_TO_VERILOG_OPTIONS += '--v_clkgate_ports=", .SCAN_MODE(TESTI__GC_BYPASS)"'

all: program.cdl
	+(cd build; $(MAKE) DEBUG_BUILD=${DEBUG_BUILD} all)

verilog:
	(cd build; $(MAKE) CDL_TO_VERILOG_OPTIONS=${CDL_TO_VERILOG_OPTIONS} -f Makefile.emulation verilog)

harnesses:
	(cd build; $(MAKE) -f Makefile.harnesses harnesses)

clean:
	rm -f test.vcd
	rm -f *.hex
	rm -f *.exe
	(cd build; rm -f models.make; make clean)

cdlclean:
	(cd ${CYCLICITY}/bin ; make allclean; make )
	(cd build; make clean)

lc3asm : lc3asm.c
	gcc -O2 lc3asm.c -o lc3asm

program.cdl : test.c tinyasm.c
	rm -f build/linux/myrisc16.cpp
	gcc test.c -o test.exe
	./test.exe
	cp test.cdl program.cdl



#a Editor preferences and notes
# Local Variables: ***
# mode: Makefile ***
# outline-regexp: "#[a!]\\\|#[	 ]*[b-z][	 ]" ***
# End: ***

