 �@ \CONSTANT W,H,MX,MU,ML ; �@ \INTEGER FU,TU,UD,DX h �@ \BYTE DS,N=FAST,I=FAST,X=FAST,CK=FAST � �@ \BYTE NP,U,PF%(,U%(,UD%( � � BABA IS C64 -- A DEMAKE -- BY NICK BENSEMA 2019 � W�10:H�11:MX�H�W�1 � � \FASTFOR � ML�3:� MAX LEVELS '		 MU�350:� MAX DELTAS/UNDOS (MORE THAN MX) E	
 � PF%(MX):� PLAYFIELD MAP [	 � RU%(31):� RULES y	 � �PP(PF)�RU%(PF%(PF)�31) �	 � �PB(PF)�RU%(PF%(PF)�31)�RU%(PF%(PF)�32) �	 � GR$(31):� GFX TILES 4X1 �	 � LV$(ML):� LEVEL DATA STRINGS 
 � DELTA LOG TILE#,OLDVALUE,MOVE# 
 � UD%(MU,2) >
 � U%(MX):� LIST OF YOU-TILES V
0 �@ \DATATYPE STRING e
1 � OBJS 0-7 �
2 � "�....",".��.","������","������","� θ ","�////","� ײ ","� -В" �
4 � PROPERTIES 8-15 	7 � "�YOU �","�WIN!�","�STOP�","�PUSH�","�SHUT�","�OPEN�" #: � "�SINK�","�LOSE�" /< � NAMES u= � " IS ","BABA","ROCK","WALL","�FLAG","�WATR","�KEY ","DOOR" �E � LEVELS. TODO: BETTER ONES �F � "@:�H@1�J@;C7@1E3BE@3EAE1BE1D@1E3BE@3C7@;�I@1�K" G � "@:�H@1�J@;C8@4C@4EAEFGE1D@5C@4C8@�I@1�K@1�L@1�M" 7H � "@:�H@1�J@;C8@4E@5A@BE@1D@5E@4C8@�I@1�K@1�N" PP � X�0�23:�GR$(X):� X jZ � N�1�ML:� LV$(N):� N ud � INIT �e � 53281,6:� 53272,21 �i L%�1 �n � L%�ML � � "�END OF GAME�" �o LV$�LV$(L%):�"��UNPACKING LEVEL"L% �r � LEVEL SELECTED s � X�0 � MX:PF%(X)�0:� X x I�0:X�1 0z T��(�(LV$,X,1)) `| �T��64 � PF%(I)�31�T:�T�128�I�I�1:PF%(I)�16 �} �T�48�T�64�I�MX�PF%(I)�PF%(I�1):�T�49�I�I�1:T�T�1:�125 �� I�I�1:X�X�1:�X���(LV$)�I�MX� 122 �� �@ \FASTFOR �� FU�0:TU�1:� UNDO UNDERFLOW TRIGGER � � X�0 � MU:UD%(X,2)�FU:� X $� UD�0:DL�0 .� �"�"; D� � BEGIN MAIN LOOP c� � WIN � WIN�0:L%�L%�1:�110 u� � BUILD RULES �� � X�0 � 7:RU%(X)�0:� X �� � 53280,5 �� � X�1 � MX�1 �� �PF%(X) �16 � � 600 �� � TODO: HAS/AND OR OTHER VERBS �� � X:� 53280,3 	� RU%(0)�0 ! U�0:WIN�0:� CK�0�MX 8N�PF%(CK):�N�0�264 RI�RU%(N�31)�RU%(N�32) ~�(I�48)�48 � NP�0:� 900:�264:� OPENSHUT ��(I�64)�64�� PF%(CK)�32 �NP�0:�900:� SINK �� I�256 � I�256��N � � 800:� TRANSFORM ��I�1�U%(U)�CK:U�U�1:�I�2�WIN�1 �CK:�400:TU�TU�1:� 53280,14 +	� DRAWSCREEN 5
� 970 d�646,14:TU�TU�TD:TD�0:� MOVE TO USER INPUT �� U�0 � �"NOTHING IS YOU. Z=UNDO R=RESET" �� WIN � �"CONGRATULATIONS. PRESS N FOR NEXT" ��TU"�?    �����";:�198,15:�K$  � K$�"R" � 114:� RESET � �(K$�".")"� " ;� K$�"N" � L%�L%�1:� 110:� ADVANCE V� K$�"Z" � 3000:� UNDO i� K$�"P" � 700 �� K$�"D" � 8000:� PRINT DATA �"� K$�"G" � �"�GOTO LEVEL";L%:� 110 �'� K$�"E" � 8500:� EDITOR �+� DO ALL AUTOMATA �,� U�0 � � 1000:� 300 ��400:� 200 3�� APPLY DELTAS AND CONVERT TO UNDO C�� UD�DL � � ^�� TURN DELTA INTO UNDO n�X�UD%(UD,0) ��NP�PF%(X):PF%(X)�UD%(UD,1):UD%(UD,1)�NP ��UD�UD�1:�UD�MU� UD�0 ��� UD��DL � 414 ��� TODO: SIGNAL WHETHER STACK HAS CHANGED �FU�UD%(UD,2) !�� 200:� END OF MAIN LOOP ,X� "IS" A]� DX�1 � W � W�1 MaCK�X�DX ^b� CK�0 � 645 �cN�PF%(CK)�31:�(N � 24)��16 � 645 �lN�N � 7:CK�X�DX �p� CK�MX � 645 �qI�PF%(CK)�31 �v�(I�24)�8 � RU%(N)�RU%(N)�2�(I�7):� PROPERTY "��(I�24)�16 � RU%(N)�RU%(N)�((I�7)�256):� TRANSFORM +�� DX 1�� <�� POKE N�� "POKE";X,T$ ���T$�""�X��0�X��MX� PF%(X)��(T$)�31:T$��(T$,2):X�X�1:�720 ��� 200 � � NOUN-IS-NOUN �)� NO RULE CHANGES SO JUST DRAW AND PUSH TO UNDO STACK *UD%(UD,0)�CK:UD%(UD,1)�PF%(X):UD%(UD,2)�TU:TD�1 1/UD�UD�1:� UD�MU � UD�0 ;0DL�UD U4PF%(CK)�I�256:N�I�256 [Q� z�� PUSH TO DELTA-UNDO STACK ��UD%(DL,0)�CK:UD%(DL,1)�NP:UD%(DL,2)�TU ��DL�DL�1:�DL�MU � DL�0 ��� ��� DRAWSCREEN ���"";:� N�0�MX:�GR$(PF%(N)�31);:� N �� �� PUT CURSOR AT X TILE 5��""�X)�X)�X)�X); ;�� Z�� CALCULATE DX BASED ON K$ l�� K$�""�DX�1 �� K$�"�"�DX��1 ��� K$�""�DX�W ��� K$�"�"�DX��W ��� ��� OBJ AT X IS YOU ��U�U�1 ��DX�0:X�U%(U) ��� 990:� GET DX �� K$�"�"�DX��1 �� K$�""�DX�W &�� K$�"�"�DX��W 5�� DX�0 � � P�� X�DX�0 � X�DX�MX � � p� OBJ AT X WANTS TO MOVE DX �DS�X�DX:CK�DS �$�CK�0�CK�MX��:� STOP AT EDGE �(��PP(CK)�8 � CK�CK�DX:� 1060:� PUSH PROPERTY )�PF%(CK)�24 � CK�CK�DX:� 1060:� PUSH TEXT .��PP(CK)�4� �:� STOP 6=�(�PP(CK)�64)�0 � 1090 VB� MOVE ALL TILES HEAD-FIRST iGBG�PF%(CK)�224 �I�PF%(CK)�8��(�PP(CK)�44)�0�BG�PF%(CK)�32 �LNP�(PF%(CK�DX)�31)� BG:�900 �V� CK��DS � CK�CK�DX:� 1095 `CK�CK�DX:NP�PF%(X)�32:� 900:� RESTORE BG �� �� --UNDO-- 2��@ \FASTFOR:\FASTARRAY >�TU�TU�1 [�� TU��FU � TU�FU�1:�3400 vUD�UD�1:� UD�0 � UD�MU ���UD%(UD,2)��TU � 3350 ��UD%(UD,2)�FU:PF%(UD%(UD,0))�UD%(UD,1) ��� 3100 �UD�UD�1:� UD�MU � UD�0 �DL�UD �H� 210 @� "D" FOR PRINT DATA $E� MX�0 � � "CAN'T" <J� "79 DATA ";�(34); ITCK�0:X�0 \X� X��MX � 8098 tYNP�PF%(X):N�NP � 31 �Z�X�MX�1��PF%(X�1)�16� ��(192�N);:CK�X�2:� 8050 �[� �(64�N); �\� NP�31 � � �(35�NP�32); �^� RUN LENGTH DETECTION? cCK�CK�1:� CK��MX � 8045 #h� PF%(CK)�NP � 8035 >m�(CK�1)�X���(47�CK�X); NrX�CK:� 8024 c�� 646,14:� �(34) i�� ~4!� "E" FOR EDITOR �9!X�0:�"F7=EXIT"; �>!� 980:�"�>";�(64�PF%(X)�32);�(64�(PF%(X)�31));"�<�"; �H!�K$:�K$�""�8510 �R!DX�0:� 990:� DX�0 � 8600 \!� 980:� GR$(PF%(X)�31); 3f!X�X�DX:� X�0 � X�X�MX Hp!� X��MX � X�X�MX Sz!� 8520 ��!�"?�";:�K$�"�"� 150:� BACK TO GAME (CLEAR UNDO) ��!� K$�"�"� � TODO:F5=SAVE ��!� K$�"�"� � TODO:F3=LOAD ��!� K$�"�"� � 8800:� 970:� 8510:� HELP ��!N��(K$) /�!�(N�224)�64 ��"##";:PF%(X)�(PF%(X)�224)�(N�31):�8510 l�!�(N�248)�192 ��"$$";:PF%(X)�(PF%(X)�31)�((N�7)�32):�8510 w�!� 8520 �`"� HELP �j"�"�"; �t"� I�0�15 �y"� " �";�(I�64);" ";GR$(I); �z"� �20);" �";�(I�72);" ";GR$(I�16) �{"� I �~"�K$:�K$�""�8830  "�   