

;dumb.prg ==0801==
   10 rem@ \word x:\integer y
   15 rem@ \real z
   20 x=31
   25 y=x:z=y
   30 for i=1 to 20
   40 x=x*2+1
   41 y=y*2+1
   42 z=z*2+1
   50 print i;":";x;y;z;
   60 print x and 255;y and 255;z and 255
   70 next i

