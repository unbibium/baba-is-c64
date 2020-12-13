#!/bin/bash

# dev script to run baba.prg in BASIC and recompile afterwards. 

X64="$(which x64 x64sc x128)"

make baba.prg
x64sc -autostartprgmode 0 baba.prg

# for dev purposes, if baba.prg is newer, reverse-compile it back to bas
if [[ -N baba.prg ]]
then
	petcat baba.prg >|baba.bas
	make compile
fi


