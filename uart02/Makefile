
all : uart02.bin

clean :
	rm -f *.bin
	rm -f *.blif
	rm -f *.txt

allclean : clean
	rm -f uart02.v


uart02.v : uart02.cdl
	cdl --verilog uart02.v uart02.cdl

uart02.blif : uart02.v
	yosys -p "synth_ice40 -blif uart02.blif" uart02.v

uart02.txt : uart02.blif icestick.pcf
	arachne-pnr -d 1k -p icestick.pcf uart02.blif -o uart02.txt

uart02.bin : uart02.txt
	icepack uart02.txt uart02.bin

prog : uart02.bin
	iceprog uart02.bin

