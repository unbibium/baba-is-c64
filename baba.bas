

;baba.prg ==0801==
    1 rem@ \constant w,h,mx,mu,ml,sm,is
    3 rem@ \integer fu,tu,ud,dx,r
    4 rem@ \byte td,nl
    5 rem@ \byte ds,n=fast,i=fast,x=fast,ck=fast
    7 rem@ \byte t,np,u,pf%(,u%(,ud%(,tr%(
    8 rem \fastfor
    9 rem baba is c64 -- a demake -- by nick bensema 2019
   10 w=10:h=18:mx=h*w-1:sm=49152:is=31
   15 ml=5:rem max levels
   20 mu=350:rem max deltas/undos (more than mx)
   25 dim pf%(mx):rem playfield map
   30 dim ru%(31),tr%(7):rem rules
   35 def fnpp(pf)=ru%(pf%(pf)and31)
   40 dim gr$(31):rem gfx tiles 4x1
   45 dim lv$(ml):rem level data strings
   50 rem delta log tile#,oldvalue,move#
   55 dim ud%(mu,2)
   60 dim u%(mx-1):rem list of you-tiles
   65 for n=0to31:read gr$(n):next n
   70 for n=1toml:read lv$(n):next n
  100 rem init
  105 poke 53281,6:poke 53272,21
  110 l%=1:i=0
  115 if l%>ml then print "{clr}{wht}end of game{lblu}":end
  119 for x=0 to mx:pf%(x)=0:next x
  120 i=0:l2=l%
  125 lv$=lv$(l2):print"{clr}{yel}unpacking level"l%;".";l2-l%
  135 x=1
  140 t=asc(mid$(lv$,x,1))
  141 ift=191then l2=l2+1:goto 120
  144 ift=255thent=34
  145 ift>=64 then pf%(i)=31andt:ift>128theni=i+1:pf%(i)=is
  147 ift>32 and t<48 and i<mx then pf%(i)=0:i=i+1:t=t-1:goto 147
  150 ift>48andt<64andi<mxthenpf%(i)=pf%(i-1):ift>49theni=i+1:t=t-1:goto150
  155 i=i+1:x=x+1:ifx<=len(lv$)andi<mxthen 140
  165 fu=0:tu=1:rem undo underflow trigger
  170 for x=0 to mu:ud%(x,2)=fu:next x
  175 ud=0:dl=0
  180 print"{clr}";
  200 rem begin main loop
  205 if win then win=0:l%=l2+1:goto115
  210 rem build rules
  215 for x=0 to 7:ru%(x)=0:tr%(x)=0:next x
  220 poke 53280,5
  225 for x=1 to mx-1
  230 ifpf%(x) =is then gosub 600
  235 rem todo: has/and or other verbs
  240 next x:poke 53280,3
  245 ru%(0)=0
  250 u=0:win=0:for ck=0tomx
  255 n=pf%(ck):ifn=0then295
  260 if(nand24)=0theniftr%(nand7)theniftr%(nand7)<>(nand7) then gosub700:rem fg
  265 ifn>32theniftr%(n/32)theniftr%(n/32)<>int(n/32) then gosub720:rem bg
  270 r=ru%(nand31)orru%(n/32)
  275 if(rand48)=48 then np=0:gosub 765:goto295:rem open-shut destroys both
  280 if(rand64)=64thenif pf%(ck)>32 thennp=0:gosub765:rem sink
  285 if(rand768)=768then dr=512:gosub 785:goto295:rem hot/melt
  286 if(rand129)=129 then dr=1:gosub 785:goto295:rem you/lose
  290 ifrand1thenu%(u)=ck:u=u+1:ifrand2thenwin=1
  295 nextck:gosub500:poke 53280,14
  300 gosub 900:rem draw screen
  305 poke646,14:tu=tu+td:td=0:rem move to user input
  310 if u=0 then print"nothing is you. z=undo r=reset"
  315 if win then print"congratulations. press n for next"
  400 printtu"{left}?    {left}{left}{left}{left}{left}";:wait198,15:getk$
  405 if k$="r" then 120:rem reset
  410 print asc(k$+".")"{left} {up}"
  415 if k$="n" then l%=l2+1:goto 115:rem advance
  420 if k$="z" then 2000:rem undo
  425 if k$="p" then 2150:rem poke
  430 if k$="d" then 2055:rem print data
  435 if k$="g" then input"{clr}goto level";l%:goto 115
  440 if k$="e" then 2200:rem editor
  445 rem send input to each you-tile
  450 dx=0:gosub 2500:if dx=0 or u=0 then 465
  454 rem assume dx never changes
  455 su=(1-u)*(dx>0):se=(1-u)*(dx<0)
  460 x=u%(su):gosub 1020:ifsu<>se thensu=su-sgn(dx):goto 460
  465 gosub500:goto 200
  500 rem apply deltas and convert to undo
  505 if ud=dl then return
  506 td=1
  510 rem turn delta into undo
  515 x=ud%(ud,0)
  520 np=ud%(ud,1):ud%(ud,1)=pf%(x)
  521 if(npand31)=int(np/32) then np=npand31:rem absorb doules
  522 pf%(x)=np
  525 ud=ud+1:ifud>muthen ud=0
  530 if ud<>dl then 515
  535 rem todo: signal whether stack has changed
  540 fu=ud%(ud,2)
  545 return:rem end of applying deltas
  600 rem "is"
  605 for dx=1 to w step w-1
  610 ck=x-dx
  615 if ck<0 then 650
  620 n=pf%(ck)and31:if(n and 24)<>8 then 650
  625 n=n and 7:ck=x+dx
  630 if ck>mx then 650
  635 i=pf%(ck)and31
  640 if(iand24)>15 then ru%(n)=ru%(n)or2^(iand15):rem property
  645 if(iand24)=8 then tr%(n)=iand7:rem transform
  650 next dx
  655 return
  700 rem noun-is-noun
  705 gosub 740
  710 n=nand224ortr%(nand7):pf%(ck)=n
  715 return
  720 rem noun-is-noun background
  725 gosub 740
  730 n=nand31or(tr%(n/32)*32):pf%(ck)=n
  735 return
  740 rem push to undo stack after delta loop already ran
  745 ud%(ud,0)=ck:ud%(ud,1)=pf%(ck):ud%(ud,2)=tu:td=1
  750 ud=ud+1:if ud>mu then ud=0
  755 dl=ud
  760 return
  765 rem push to delta-undo stack
  770 ud%(dl,0)=ck:ud%(dl,1)=np:ud%(dl,2)=tu
  775 dl=dl+1:ifdl>mu then dl=0
  780 return
  785 rem destroy object at ck with rule dr.  original value is n
  790 if ru%(nand31) and dr then np=n/32:goto 765
  795 if ru%(n/32) and dr then np=nand31:goto 765
  800 return
  900 rem drawscreen
  905 print"{home}";:for n=0tomx:printgr$(pf%(n)and31);:next n
  910 return
  915 rem put cursor at x tile
  920 print"{home}"spc(x)spc(x)spc(x)spc(x);
  925 return
  930 goto 2500
 1000 rem obj at x is you
 1005 u=u-1
 1010 dx=0:x=u%(u)
 1015 gosub 2500:rem get dx
 1020 if dx=0 then return
 1025 if x+dx<0 or x+dx>mx then return
 1030 rem obj at x wants to move dx
 1035 ds=x+dx:ck=ds
 1040 ifck<0orck>mxthenreturn:rem stop at edge
 1045 iffnpp(ck)and8 then ck=ck+dx:goto 1040:rem push property
 1050 ifpf%(ck)and24 then ck=ck+dx:goto 1040:rem push text
 1055 iffnpp(ck)and4then return:rem stop
 1060 if(fnpp(ck)and64)=0 then 1065
 1065 rem move all tiles head-first
 1070 bg=pf%(ck)and224
 1075 ifpf%(ck)<8thenif(fnpp(ck)and44)=0thenbg=pf%(ck)*32
 1080 np=(pf%(ck-dx)and31)or bg:gosub765
 1085 if ck<>ds then ck=ck-dx:goto 1070
 1090 ck=ck-dx:np=pf%(x)/32:gosub 765:rem restore bg
 1095 return
 2000 rem "z" for undo
 2005 rem@ \fastfor:\fastarray
 2010 tu=tu-1:td=0
 2015 if tu<=fu then tu=fu+1:goto2050
 2020 ud=ud-1:if ud<0 then ud=mu
 2025 ifud%(ud,2)<>tu then 2040
 2030 ud%(ud,2)=fu:pf%(ud%(ud,0))=ud%(ud,1)
 2035 goto 2020
 2040 ud=ud+1:if ud>mu then ud=0
 2045 dl=ud
 2050 goto 215
 2055 rem "d" for print data
 2060 if mx=0 then print "can't"
 2065 ck=0:x=0:nl=ml
 2069 nl=nl+1
 2070 print9280+nl*10;"dA";chr$(34);
 2075 if x>=mx then 2125
 2080 np=pf%(x):n=np and 31
 2085 ifx<mx-1thenifpf%(x+1)=is then printchr$(192+n);:ck=x+2:goto 2120
 2090 print chr$(64+n);
 2095 if np>31 then print chr$(35+np/32);
 2100 rem run length detection?
 2105 ck=ck+1:if ck>=mx then 2115
 2110 if pf%(ck)=np and ck-x<16 then 2105
 2115 if(ck-1)>x thenprintchr$(47+ck-x);
 2116 if(ck-1)>x and np=0 then print chr$(20)chr$(20)chr$(31+ck-x);
 2117 if(ck-3)=x and np=0 then print chr$(20)chr$(255);:rem repl "{$a0}with ~
 2118 if ck>=mx then 2125
 2120 x=ck:if peek(211)<75 then 2075
 2121 print"{CBM-B}"chr$(34):goto 2069:rem add another data
 2125 poke 646,14:print chr$(34)
 2135 print15"ml=";nl;":rem max levels"
 2140 end
 2150 rem "p" for poke
 2155 input "poke";x,t$
 2160 ift$>""andx>=0andx<=mxthenpf%(x)=asc(t$)and31:t$=mid$(t$,2):x=x+1:goto2160
 2165 goto 200
 2200 rem "e" for editor
 2205 x=0
 2210 print"{lblu} {rvon}f1{rvof}=legend {rvon}f3{rvof}=restore {rvon}f5{rvof}=save {rvon}f7{rvof}=quit"
 2215 print" {rvon}crsr{rvof}=move {rvon}a-z{rvof}=set {rvon}shift{rvof}+{rvon}a-g{rvof}=bg"
 2220 gosub 915:print"{cyn}{rvof}>{grn}";chr$(64+pf%(x)/32);chr$(64+(pf%(x)and31));"{cyn}<{left}";
 2225 getk$:ifk$=""then2220
 2230 dx=0:if(asc(k$)and99)=1 then gosub2500
 2231 if dx=0 then 2255
 2235 gosub 915:print"{rvof}"gr$(pf%(x)and31);
 2240 x=x+dx:if x<0 then x=x+mx
 2245 if x>=mx then x=x-mx
 2250 goto 2225
 2255 print"?{left}";:ifk$="{f7}"then 165:rem back to game (clear undo)
 2260 if k$="{f5}"then 2445:rem save
 2265 if k$="{f3}"then 2470:rem load
 2270 if k$="{f1}"then gosub 2400:gosub 900:goto 2205:rem help
 2274 if k$=" " then pf%(x)=0:goto2220
 2275 n=asc(k$)
 2276 if n=20 then pf%(x)=pf%(x)/32:goto2220
 2280 if(nand224)=64 then pf%(x)=(pf%(x)and224)or(nand31):goto2220
 2285 if(nand248)=192 then pf%(x)=(pf%(x)and31)or((nand7)*32):goto2220
 2290 goto 2225
 2400 rem editor "f1" for help
 2405 print"{clr}";
 2410 for i=0to15
 2415 print " {cyn}";chr$(i+64);" ";gr$(i);
 2420 print tab(20);" {cyn}";chr$(i+80);" ";gr$(i+16)
 2425 next i
 2430 print " {wht} press any key to return"
 2435 getk$:ifk$=""then2435
 2440 return
 2445 rem editor "f5" save to memory
 2450 poke 53281,14:poke 53280,1
 2455 for ck=0 to mx-1:poke sm+ck,pf%(ck):next
 2460 poke 53281,6:poke 53280,14
 2465 goto 2220
 2470 rem editor "f3" load from memory
 2475 poke 53281,14:poke 53280,1
 2480 for ck=0 to mx-1:pf%(ck)=peek(sm+ck):next
 2485 poke 53281,6:poke 53280,14
 2490 gosub 900:goto 2205
 2495 rem@ \datatype string
 2500 rem calculate dx based on k$
 2505 if k$="{rght}" or k$="l" thendx=1
 2510 if k$="{left}" or k$="h" thendx=-1
 2515 if k$="{down}" or k$="j" thendx=w
 2520 if k$="{up}" or k$="k" thendx=-w
 2525 return
 9000 rem objs 0-7
 9010 data "{blk}....","{wht}.ZZ."
 9020 data "{gry3}{CBM-D}{rvon}{CBM-Y}{CBM-Y}{rvof}{CBM-F}","{orng}{rvon}{CBM-R}{CBM-E}{CBM-R}{CBM-E}{rvof}"
 9030 data "{yel} N{CBM-U} ","{lblu}////"
 9040 data "{yel} W{CBM-R} ","{rvon}{red}O -P{rvof}"
 9050 rem names 8-15
 9060 data "{red}{rvon}  8 ","{wht}{rvof}baba"
 9070 data "{wht}{rvof}rock","{wht}{rvof}wall"
 9080 data "{wht}{rvof}flag","{wht}{rvof}watr"
 9090 data "{wht}{rvof}key ","{wht}{rvof}door"
 9100 rem properties/verbs 16-31
 9110 rem property is ru%(obj) and...
 9120 data "{cyn}{rvon}you {rvof}":rem 1
 9130 data "{cyn}{rvon}win!{rvof}":rem 2
 9140 data "{cyn}{rvon}stop{rvof}":rem 4
 9150 data "{cyn}{rvon}push{rvof}":rem 8
 9160 data "{cyn}{rvon}shut{rvof}":rem 16
 9170 data "{cyn}{rvon}open{rvof}":rem 32
 9180 data "{cyn}{rvon}sink{rvof}":rem 64
 9190 data "{cyn}{rvon}lose{rvof}":rem 128
 9200 data "{cyn}{rvon}hot {rvof}":rem 256
 9210 data "{cyn}{rvon}melt{rvof}":rem 512
 9220 data "{cyn}{rvon} 26 {rvof}":rem 1024
 9230 data "{cyn}{rvon} 27 {rvof}":rem 2048
 9240 data "{cyn}{rvon} 28 {rvof}":rem 4096
 9250 data "{cyn}{rvon} 29 {rvof}":rem 8192
 9260 data "{wht}{rvof}has","{wht}{rvof} is "
 9270 rem level data - use "d" to create
 9280 data"*Ip!Kr+c7!e3be#eae1be1d!e3be#c7+Lq!Js"
 9290 data"c?c7$c4{SHIFT-*}~c4~q@c1'c1@l!d~c1%a@c?c4*i@k&_{SHIFT-*}&p@r"
 9300 data"/Lq@c?~c6@d@c6~c;'c1@Kr#c1'c1'c1@a%c1'c:*Ip/("
 9310 data"Ipc6Krc$cMvc@Js@c4$c4@a~c4!b1@c4e4c1(c(c(ce2%ce2!Lq@cde1%c9"
 9320 data"c4!Krc~c$c@a@c$c~c$c1bc1/~Js!l(_e4#qe~e$e@d@e$e~e$e4/~cIpc/%Mw"

