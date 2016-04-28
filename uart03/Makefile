
all : uart03.bin

clean :
	rm -f *.bin
	rm -f *.blif
	rm -f *.txt

allclean : clean
	rm -f uart03.v


uart03.v : uart03.cdl
	cdl --verilog uart03.v uart03.cdl

uart03.blif : uart03.v
	yosys -p "synth_ice40 -blif uart03.blif" uart03.v

uart03.txt : uart03.blif icestick.pcf
	arachne-pnr -d 1k -p icestick.pcf uart03.blif -o uart03.txt

uart03.bin : uart03.txt
	icepack uart03.txt uart03.bin

prog : uart03.bin
	iceprog uart03.bin

