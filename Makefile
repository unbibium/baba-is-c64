PETCAT=petcat
BBCOMPILE=bbcompiler

all: baba.prg baba-compiled.prg

baba.prg: 
	$(PETCAT) -w2 baba.bas >baba.prg

baba-compiled.prg:
	$(BBCOMPILE) baba.prg baba-compiled.prg

clean:
	rm *.prg

