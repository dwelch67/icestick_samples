
all : uart01.bin

clean :
	rm -f *.bin
	rm -f *.blif
	rm -f *.txt

allclean : clean
	rm -f uart01.v


uart01.v : uart01.cdl
	cdl --verilog uart01.v uart01.cdl

uart01.blif : uart01.v
	yosys -p "synth_ice40 -blif uart01.blif" uart01.v

uart01.txt : uart01.blif icestick.pcf
	arachne-pnr -d 1k -p icestick.pcf uart01.blif -o uart01.txt

uart01.bin : uart01.txt
	icepack uart01.txt uart01.bin

prog : uart01.bin
	iceprog uart01.bin

