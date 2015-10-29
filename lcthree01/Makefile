
all : lcthree01.bin

clean :
	rm -f *.bin
	rm -f *.blif
	rm -f *.txt
	rm -f lc3asm
	rm -f lc3dis
	rm -f program.h
	rm -f *.hex

allclean : clean
	rm -f top.v
	rm -f core.v
	rm -f csram.v
	rm -f program.h


core.v : cdl/core.cdl
	cdl --verilog core.v cdl/core.cdl

program.h : test.asm lc3asm lc3dis
	./lc3asm test.asm
	./lc3dis test.asm.hex

csram.v : cdl/csram.cdl cdl/program.cdl
	cdl --verilog csram.v cdl/csram.cdl --include-dir=cdl
	
top.v : cdl/top.cdl
	cdl --verilog top.v cdl/top.cdl

lc3asm : lc3asm.c
	gcc -O2 lc3asm.c -o lc3asm

lc3dis : lc3dis.c readhex.c
	gcc -O2 lc3dis.c -o lc3dis readhex.c

lcthree01.blif : lcthree01.v top.v csram.v core.v sram.v program.h
	yosys -p "read_verilog lcthree01.v; read_verilog top.v; read_verilog core.v; read_verilog sram.v; synth_ice40 -blif lcthree01.blif"

lcthree01.txt : lcthree01.blif icestick.pcf
	arachne-pnr -d 1k -p icestick.pcf lcthree01.blif -o lcthree01.txt

lcthree01.bin : lcthree01.txt
	icepack lcthree01.txt lcthree01.bin

prog : lcthree01.bin
	iceprog lcthree01.bin

