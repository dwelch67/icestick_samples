
all : blinker03.bin

clean :
	rm -f *.bin
	rm -f *.blif
	rm -f *.txt

allclean : clean
	rm -f blinker03.v


blinker03.v : blinker03.cdl
	cdl --verilog blinker03.v blinker03.cdl

blinker03.blif : blinker03.v outer.v
	yosys -p "synth_ice40 -blif blinker03.blif" outer.v blinker03.v

blinker03.txt : blinker03.blif pins.pcf
	arachne-pnr -d 8k -p pins.pcf blinker03.blif -o blinker03.txt

blinker03.bin : blinker03.txt
	icepack blinker03.txt blinker03.bin

prog : blinker03.bin
	iceprog blinker03.bin

