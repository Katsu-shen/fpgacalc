# Makefile for FPGAcalc (Quartus/Verilog)


# Project settings
PROJECT = fpgacalc
TOPLEVEL = top.v
QUARTUS_SH = quartus_sh
SOF_FILE = $(PROJECT).sof

# Default target
all: compile

#compile/synthesize
compile:
	$(QUARTUS_SH) --flow compile $(PROJECT).qpf

# program fpga
program: $(SOF_FILE)
	quartus_pgm -c USB-Blaster -m JTAG -o "p;$(SOF_FILE)"

# Clean build files
clean:
	rm -rf db incremental_db output_files *.rpt *.summary *.sof *.pof *.pin

#Simulation
sim:
	vsim -c -do "run -all; quit" $(TOPLEVEL)

# Phony targets
.PHONY: all compile program clean sim
