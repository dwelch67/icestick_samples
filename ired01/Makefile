
all : ired01.bin

clean :
	rm -f *.bin
	rm -f *.blif
	rm -f *.txt
	rm -f dut.vcd
	(cd build/cdl; rm -f models.make; $(MAKE) clean)

allclean : clean
	rm -f ired01.v


ired01.v : ired01.cdl
	cdl --verilog ired01.v ired01.cdl

ired01.blif : ired01.v
	yosys -p "synth_ice40 -blif ired01.blif" ired01.v

ired01.txt : ired01.blif icestick.pcf
	arachne-pnr -d 1k -p icestick.pcf ired01.blif -o ired01.txt

ired01.bin : ired01.txt
	icepack ired01.txt ired01.bin

prog : ired01.bin
	iceprog ired01.bin

