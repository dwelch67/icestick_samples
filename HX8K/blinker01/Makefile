
all : blinker01.bin

clean :
	rm -f *.bin
	rm -f *.blif
	rm -f *.txt

allclean : clean
	rm -f blinker01.v


blinker01.v : blinker01.cdl
	cdl --verilog blinker01.v blinker01.cdl

blinker01.blif : blinker01.v
	yosys -p "synth_ice40 -blif blinker01.blif" blinker01.v

blinker01.txt : blinker01.blif pins.pcf
	arachne-pnr -d 8k -p pins.pcf blinker01.blif -o blinker01.txt

blinker01.bin : blinker01.txt
	icepack blinker01.txt blinker01.bin

prog : blinker01.bin
	iceprog blinker01.bin

