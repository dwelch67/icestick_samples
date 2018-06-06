
all : blinker02.bin

clean :
	rm -f *.bin
	rm -f *.blif
	rm -f *.txt

allclean : clean
	rm -f blinker02.v


blinker02.v : blinker02.cdl
	cdl --verilog blinker02.v blinker02.cdl

blinker02.blif : blinker02.v outer.v
	yosys -p "synth_ice40 -blif blinker02.blif" outer.v blinker02.v

blinker02.txt : blinker02.blif pins.pcf
	arachne-pnr -d 8k -p pins.pcf blinker02.blif -o blinker02.txt

blinker02.bin : blinker02.txt
	icepack blinker02.txt blinker02.bin

prog : blinker02.bin
	iceprog blinker02.bin

