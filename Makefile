all: baba-is-c64.d64

basicv2/dist/basicv2.jar:
	make -C basicv2

cc1541/cc1541:
	make -C cc1541

baba-is-c64.d64: baba.prg cc1541/cc1541 Makefile
	rm -f $@
	cc1541/cc1541 -f "$(basename $<)" -w $< $@

%.prg: ++%.pp.prg Makefile
	mv $< $@

++%.pp.prg: %.pp.bas basicv2/dist/basicv2.jar Makefile config.sh
	java -cp basicv2.jar:basicv2/dist/basicv2.jar com.sixtyfour.cbmnative.shell.MoSpeedCL $< $(shell sh config.sh)

%.pp.bas: %.bas Makefile
	sed -E '/^ *;/ d; s,:+ *rem.*$$,,; /^$$/ d; s,^ *,,;'  $< > $@ || rm -f $@

.PHONY: all cc1541/cc1541 basicv2/dist/basicv2.jar
