

;baba.prg ==0801==
    1 rem@ \constant w,h,mx,mu,ml
    2 rem@ \integer fu,tu,ud,dx,ck,ds
    4 rem@ \byte np,u,n,pf%(,u%(,ud%(:\word x,i
    5 rem baba is c64 -- a demake -- by nick bensema 2019
    6 w=10:h=11:mx=h*w-1
    7 rem \fastfor
    8 ml=3:rem max levels
    9 mu=350:rem max deltas/undos (more than mx)
   10 dim pf%(mx):rem playfield map
   12 dim ru%(31):rem rules
   13 def fnpp(pf)=ru%(pf%(pf)and31)
   14 def fnpb(pf)=ru%(pf%(pf)and31)orru%(pf%(pf)/32)
   15 dim gr$(31):rem gfx tiles 4x1
   17 dim lv$(ml):rem level data strings
   18 rem delta log tile#,oldvalue,move#
   19 dim ud%(mu,2)
   20 dim u%(mx):rem list of you-tiles
   48 rem@ \datatype string
   49 rem objs 0-7
   50 data "{blk}....","{wht}.ZZ.","{gry3}{CBM-D}{rvon}{CBM-Y}{CBM-Y}{rvof}{CBM-F}","{orng}{rvon}{CBM-R}{CBM-E}{CBM-R}{CBM-E}{rvof}","{yel} N{CBM-U} ","{lblu}////","{yel} W{CBM-R} ","{rvon}{red}O -P{rvof}"
   52 rem properties 8-15
   55 data "{cyn}{rvon}you {rvof}","{cyn}{rvon}win!{rvof}","{cyn}{rvon}stop{rvof}","{cyn}{rvon}push{rvof}","{cyn}{rvon}shut{rvof}","{cyn}{rvon}open{rvof}"
   58 data "{cyn}{rvon}sink{rvof}","{cyn}{rvon}lose{rvof}"
   60 rem names
   61 data "{wht} is ","{wht}baba","{wht}rock","{wht}wall","{yel}flag","{lblu}watr","{yel}key ","{wht}door"
   69 rem levels. todo: better ones
   70 data "@:Qh@1Sj@;c7@1e3be@3eae1be1d@1e3be@3c7@;Ti@1Rk"
   71 data "@:Qh@1Sj@;c8@4c@4eaefge1d@5c@4c8@Ti@1Vk@1Wl@1Vm"
   72 data "@:Qh@1Sj@;c8@4e@5a@be@1d@5e@4c8@Ti@1Rk@1Un"
   80 for x=0to23:readgr$(x):next x
   90 for n=1toml:read lv$(n):next n
  100 rem init
  101 poke 53281,6:poke 53272,21
  105 l%=1
  110 if l%>ml then print "{clr}{wht}end of game{lblu}"
  111 lv$=lv$(l%):print"{clr}{yel}unpacking level"l%
  114 rem level selected
  115 for x=0 to mx:pf%(x)=0:next x
  120 i=0:x=1
  122 t=asc(mid$(lv$,x,1))
  124 ift>=64 then pf%(i)=31andt:ift>128theni=i+1:pf%(i)=16
  125 ift>48andt<64andi<mxthenpf%(i)=pf%(i-1):ift>49theni=i+1:t=t-1:goto125
  128 i=i+1:x=x+1:ifx<=len(lv$)andi<mxthen 122
  130 rem@ \fastfor
  150 fu=0:tu=1:rem undo underflow trigger
  155 for x=0 to mu:ud%(x,2)=fu:next x
  160 ud=0:dl=0
  190 print"{clr}";
  200 rem begin main loop
  205 if win then win=0:l%=l%+1:goto110
  209 rem build rules
  210 for x=0 to 7:ru%(x)=0:next x
  215 poke 53280,5
  230 for x=1 to mx-1
  231 ifpf%(x) =16 then gosub 600
  240 rem todo: has/and or other verbs
  250 next x:poke 53280,3
  255 ru%(0)=0
  256 u=0:win=0:for ck=0tomx
  257 n=pf%(ck):ifn=0then264
  258 i=ru%(nand31)orru%(n/32)
  259 if(iand48)=48 then np=0:gosub 900:goto264:rem openshut
  260 if(iand64)=64thenif pf%(ck)>32 thennp=0:gosub900:rem sink
  262 if i>256 and i/256<>n then gosub 800:rem transform
  263 ifiand1thenu%(u)=ck:u=u+1:ifiand2thenwin=1
  264 nextck:gosub400:tu=tu+1:poke 53280,14
  265 rem drawscreen
  266 print"{home}";:for n=0tomx:printgr$(pf%(n)and31);:next n
  267 poke646,14:tu=tu+td:td=0:rem move to user input
  268 if u=0 then print"nothing is you. z=undo r=reset"
  269 if win then print"congratulations. press n for next"
  270 printtu"{left}?    {left}{left}{left}{left}{left}";:wait198,15:getk$
  275 if k$="r" then 114:rem reset
  276 print asc(k$+".")"{left} "
  277 if k$="n" then l%=l%+1:goto 110:rem advance
  278 if k$="z" then 3000:rem undo
  280 if k$="p" then 700
  285 if k$="d" then 8000:rem print data
  290 if k$="g" then input"{clr}goto level";l%:goto 110
  299 rem do all automata
  300 if u>0 then gosub 1000:goto 300
  399 gosub400:goto 200
  400 rem apply deltas and convert to undo
  410 if ud=dl then return
  413 rem turn delta into undo
  414 x=ud%(ud,0)
  415 np=pf%(x):pf%(x)=ud%(ud,1):ud%(ud,1)=np
  416 ud=ud+1:ifud>muthen ud=0
  420 if ud<>dl then 414
  424 rem todo: signal whether stack has changed
  426 fu=ud%(ud,2)
  450 goto 200:rem end of main loop
  600 rem "is"
  605 for dx=1 to w step w-1
  609 ck=x-dx
  610 if ck<0 then 645
  611 n=pf%(ck)and31:if(n and 24)<>16 then 645
  620 n=n and 7:ck=x+dx
  624 if ck>mx then 645
  625 i=pf%(ck)and31
  630 if(iand24)=8 then ru%(n)=ru%(n)or2^(iand7):rem property
  640 if(iand24)=16 then ru%(n)=ru%(n)or((iand7)*256):rem transform
  645 next dx
  650 return
  700 rem poke
  710 input "poke";x,t$
  720 ift$>""andx>=0andx<=mxthen pf%(x)=asc(t$)and31:t$=mid$(t$,2):x=x+1:goto720
  730 goto 200
  800 rem noun-is-noun
  809 rem no rule changes so just draw and push to undo stack
  810 ud%(ud,0)=ck:ud%(ud,1)=pf%(x):ud%(ud,2)=tu:td=1
  815 ud=ud+1:if ud>mu then ud=0
  816 dl=ud
  820 pf%(ck)=i/256:n=i/256
  849 return
  900 rem push to delta-undo stack
  910 ud%(dl,0)=ck:ud%(dl,1)=np:ud%(dl,2)=tu
  920 dl=dl+1:ifdl>mu then dl=0
  930 return
 1000 rem obj at x is you
 1001 u=u-1
 1002 dx=0:x=u%(u)
 1005 if k$="{rght}"thendx=1
 1006 if k$="{left}"thendx=-1
 1007 if k$="{down}"thendx=w
 1008 if k$="{up}"thendx=-w
 1009 if dx=0 then return
 1010 if x+dx<0 or x+dx>mx then return
 1050 rem obj at x wants to move dx
 1055 ds=x+dx:ck=ds
 1060 ifck<0orck>mxthenreturn:rem stop at edge
 1064 iffnpp(ck)and8 then ck=ck+dx:goto 1060:rem push property
 1065 ifpf%(ck)and24 then ck=ck+dx:goto 1060:rem push text
 1070 iffnpp(ck)and4then return:rem stop
 1085 if(fnpp(ck)and64)=0 then 1090
 1090 rem move all tiles head-first
 1095 bg=pf%(ck)and224
 1097 ifpf%(ck)<8thenif(fnpp(ck)and44)=0thenbg=pf%(ck)*32
 1100 np=(pf%(ck-dx)and31)or bg:gosub900
 1110 if ck<>ds then ck=ck-dx:goto 1095
 1120 ck=ck-dx:np=pf%(x)/32:gosub 900:rem restore bg
 1999 return
 3000 rem --undo--
 3010 rem@ \fastfor:\fastarray
 3030 tu=tu-1
 3050 if tu<=fu then tu=fu+1:goto3400
 3100 ud=ud-1:if ud<0 then ud=mu
 3200 ifud%(ud,2)<>tu then 3350
 3210 ud%(ud,2)=fu:pf%(ud%(ud,0))=ud%(ud,1)
 3220 goto 3100
 3350 ud=ud+1:if ud>mu then ud=0
 3355 dl=ud
 3400 goto 210
 8000 rem "d" for print data
 8005 if mx=0 then print "can't"
 8010 print "79 data ";chr$(34);
 8020 ck=0:x=0
 8024 if x>=mx then 8098
 8025 np=pf%(x):n=np and 31
 8026 ifx<mx-1thenifpf%(x+1)=16then printchr$(192+n);:ck=x+2:goto 8050
 8027 print chr$(64+n);
 8028 if np>31 then print chr$(35+np/32);
 8030 rem run length detection?
 8035 ck=ck+1:if ck>=mx then 8045
 8040 if pf%(ck)=np then 8035
 8045 if(ck-1)>xthenprintchr$(47+ck-x);
 8050 x=ck:goto 8024
 8098 poke 646,14:print chr$(34)
 8099 end

