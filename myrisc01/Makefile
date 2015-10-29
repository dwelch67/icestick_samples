
all : myrisc1601.bin

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


myrisc16.v : cdl/myrisc16.cdl
	cdl --verilog myrisc16.v cdl/myrisc16.cdl --include-dir=cdl

program.h : test.asm lc3asm lc3dis
	./lc3asm test.asm
	./lc3dis test.asm.hex

myrisc1601.blif : myrisc1601.v myrisc16.v
	yosys -p "read_verilog myrisc1601.v; read_verilog myrisc16.v; synth_ice40 -blif myrisc1601.blif"

myrisc1601.txt : myrisc1601.blif icestick.pcf
	arachne-pnr -d 1k -p icestick.pcf myrisc1601.blif -o myrisc1601.txt

myrisc1601.bin : myrisc1601.txt
	icepack myrisc1601.txt myrisc1601.bin

prog : myrisc1601.bin
	iceprog myrisc1601.bin

