
CYCLICITY := $(CYCLICITY_ROOT)
SRC_ROOT := ./
PREFIX_OBJ_DIR := ./
include $(CYCLICITY)/scripts/makefile_hdr

#DEBUG_BUILD := "yes"
DEBUG_BUILD := "no"

All:: build/cdl/Makefile build/cdl/model_list
	rm -f dut.vcd
	+(cd build/cdl; $(MAKE) DEBUG_BUILD=${DEBUG_BUILD} all)

model:: build/cdl/Makefile build/cdl/model_list
	+(cd build/cdl; $(MAKE) DEBUG_BUILD=${DEBUG_BUILD} all)

verilog:: 
	echo verilog

.: build/cdl/Makefile build/cdl/model_list
	cd build/cdl; $(MAKE) DEBUG_BUILD=${DEBUG_BUILD} all

clean::
	rm -f dut.vcd
	(cd build/cdl; rm -f models.make; $(MAKE) clean)

cdlclean:
	(cd ${CYCLICITY}/bin; $(MAKE) allclean; $(MAKE) )
	(cd build/cdl; rm -f models.make; $(MAKE) clean)

