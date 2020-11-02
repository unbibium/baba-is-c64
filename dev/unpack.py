import sys

chunk = 5
w = 10
symbols = [
# 9000 rem objs 0-7
    "....", ".ZZ.",  # "{blk}....","{wht}.ZZ."
    "****", "====",  # "{gry3}{CBM-D}{rvon}{CBM-Y}{CBM-Y}{rvof}{CBM-F}","{orng}{rvon}{CBM-R}{CBM-E}{CBM-R}{CBM-E}{rvof}"
    "FLAG", "////",  # "{yel} N{CBM-U} ","{lblu}////"
    "WWWW", "O -P",  # "{yel} W{CBM-R} ","{rvon}{red}O -P{rvof}"
# 9050 rem names 8-15
    "  8 ", "baba",  # "{red}{rvon}  8 ","{wht}{rvof}baba"
    "rock", "wall",  # "{wht}{rvof}rock","{wht}{rvof}wall"
    "flag", "watr",  # "{wht}{rvof}flag","{wht}{rvof}watr"
    "key ", "door",  # "{wht}{rvof}key ","{wht}{rvof}door"
# 9100 rem properties/verbs 16-31
# 9110 rem property is ru%(obj) and...
    "you ",  # "{cyn}{rvon}you {rvof}":rem 1
    "win!",  # "{cyn}{rvon}win!{rvof}":rem 2
    "stop",  # "{cyn}{rvon}stop{rvof}":rem 4
    "push",  # "{cyn}{rvon}push{rvof}":rem 8
    "shut",  # "{cyn}{rvon}shut{rvof}":rem 16
    "open",  # "{cyn}{rvon}open{rvof}":rem 32
    "sink",  # "{cyn}{rvon}sink{rvof}":rem 64
    "lose",  # "{cyn}{rvon}lose{rvof}":rem 128
    "hot ",  # "{cyn}{rvon}hot {rvof}":rem 256
    "melt",  # "{cyn}{rvon}melt{rvof}":rem 512
    " 26 ",  # "{cyn}{rvon} 26 {rvof}":rem 1024
    " 27 ",  # "{cyn}{rvon} 27 {rvof}":rem 2048
    " 28 ",  # "{cyn}{rvon} 28 {rvof}":rem 4096
    " 29 ",  # "{cyn}{rvon} 29 {rvof}":rem 8192
    "has ", " is ",  # data "{wht}{rvof}has","{wht}{rvof} is "
]
assert 2**chunk == len(symbols)
levels = [
    #9270 rem level data - use "d" to create
    "*Ip!Kr+c7!e3be#eae1be1d!e3be#c7+Lq!Js",
    "c?c7$c4{SHIFT-*}~c4~q@c1'c1@l!d~c1%a@c?c4*i@k&_{SHIFT-*}&p@r",
    "/Lq@c?~c6@d@c6~c;'c1@Kr#c1'c1'c1@a%c1'c:*Ip/(",
    "Ipc6Krc$cMvc@Js@c4$c4@a~c4!b1@c4e4c1(c(c(ce2%ce2!Lq@cde1%c9",
    "c4!Krc~c$c@a@c$c~c$c1bc1/~Js!l(_e4#qe~e$e@d@e$e~e$e4/~cIpc/%Mw",
]

def ASC(c):
    i = ord(c)
    if 'a' <= c <= 'z':
        i = i - 32
    elif 'A' <= c <= 'Z':
        i = i + 128
    if i == 126:
        i = 255
    return i

#print(levels[0])
#print(' '.join([hex(ASC(c))[2:] for c in levels[0]]))

def MID(s, begin, length):
    return s[begin:begin+length]

def unpack_level_ported(lv, l=1):
    w=10
    h=18
    mx=h*w-1
    v_is=31
    ml=len(lv)  # rem max levels

    # 25 dim pf%(mx):rem playfield map
    # 119 for x=0 to mx:pf%(x)=0:next x
    pf = [0] * mx

    # 40 dim gr$(31):rem gfx tiles 4x1
    # 65 for n=0to31:read gr$(n):next n
    gr = symbols

    # 45 dim lv$(ml):rem level data strings
    # 70 for n=1toml:read lv$(n):next n

    # 110 l%=1
    # 115 if l%>ml then print "{clr}{wht}end of game{lblu}":end
    assert not l > ml
    # 120 i=0:l2=l%
    # 125 lv$=lv$(l2):print"{clr}{yel}unpacking level"l%;".";l2-l%
    i = 0
    l2 = l
    lv = lv[l2-1]
    print("unpacking level", l, ".", l2-l)

    # 135 x=1
    x = 1

    while x < len(lv) and i < mx:
        # 140 t=asc(mid$(lv$,x,1))
        # 155 i=i+1:x=x+1:ifx<=len(lv$)andi<mxthen 140
        t = ASC(MID(lv, x, 1))
        
        # 141 ift=191then l2=l2+1:goto 120

        # 144 ift=255thent=34
        if t == 255:
            t = 34

        # 145 ift>=64 then pf%(i)=31andt:ift>128theni=i+1:pf%(i)=is
        if t >= 64:
            pf[i] = 31 & t
            if t > 127:
                i = i + 1
                pf[i] = v_is

        # 147 ift>32 and t<48 and i<mx then pf%(i)=0:i=i+1:t=t-1:goto 147
        while t > 32 and t < 48 and i < mx:
            pf[i] = 0
            i = i + 1
            t = t - 1

        # 150 ift>48andt<64andi<mxthenpf%(i)=pf%(i-1):ift>49theni=i+1:t=t-1:goto150
        if t > 48 and t < 64 and i < mx:
            while t > 49:
                if t > 48 and t < 64 and i < mx:
                    pf[i] = pf[i-1]
                i = i + 1
                t = t - 1

        # 155 i=i+1:x=x+1:ifx<=len(lv$)andi<mxthen 140
        i = i + 1
        x = x + 1

    return pf

level_dec = unpack_level_ported(levels, 3)

for y in range(0, len(level_dec), w):
    for c in level_dec[y:y+w]:
        c = c & 31
        sys.stdout.write(symbols[c])
    print()

