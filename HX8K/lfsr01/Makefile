
all : lfsr01.bin

clean :
	rm -f *.bin
	rm -f *.blif
	rm -f *.txt

allclean : clean
	rm -f lfsr01.v


lfsr01.v : lfsr01.cdl
	cdl --verilog lfsr01.v lfsr01.cdl

lfsr01.blif : lfsr01.v
	yosys -p "synth_ice40 -blif lfsr01.blif" lfsr01.v

lfsr01.txt : lfsr01.blif pins.pcf
	arachne-pnr -d 8k -p pins.pcf lfsr01.blif -o lfsr01.txt

lfsr01.bin : lfsr01.txt
	icepack lfsr01.txt lfsr01.bin

prog : lfsr01.bin
	iceprog lfsr01.bin

