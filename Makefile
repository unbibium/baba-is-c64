PETCAT=petcat
BBCOMPILE=bbcompiler

all: baba.prg baba-compiled.prg

baba.prg: baba.bas
	$(PETCAT) -w2 baba.bas >baba.prg

baba-compiled.prg: baba.prg
	$(BBCOMPILE) baba.prg baba-compiled.prg

clean:
	rm *.prg

