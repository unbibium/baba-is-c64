% �@ \CONSTANT W,H,MX,MU,ML,SM,IS C �@ \INTEGER FU,TU,UD,DX,R p �@ \BYTE DS,N=FAST,I=FAST,X=FAST,CK=FAST � �@ \BYTE NP,U,PF%(,U%(,UD%(,TR%( � � \FASTFOR �	 � BABA IS C64 -- A DEMAKE -- BY NICK BENSEMA 2019  	
 W�10:H�11:MX�H�W�1:SM�49152:IS�31 	 ML�3:� MAX LEVELS C	 MU�350:� MAX DELTAS/UNDOS (MORE THAN MX) a	 � PF%(MX):� PLAYFIELD MAP ~	 � RU%(31),TR%(7):� RULES �	# � �PP(PF)�RU%(PF%(PF)�31) �	( � GR$(31):� GFX TILES 4X1 �	- � LV$(ML):� LEVEL DATA STRINGS 
2 � DELTA LOG TILE#,OLDVALUE,MOVE# 
7 � UD%(MU,2) 5
< � U%(MX�1):� LIST OF YOU-TILES O
A � N�0�31:� GR$(N):� N i
F � N�1�ML:� LV$(N):� N t
d � INIT �
i � 53281,6:� 53272,21 �
n L%�1 �
s � L%�ML � � "�END OF GAME�":� �
x LV$�LV$(L%):�"��UNPACKING LEVEL"L% �
} � LEVEL SELECTED � � X�0 � MX:PF%(X)�0:� X � I�0:X�1 1� T��(�(LV$,X,1)) a� �T��64 � PF%(I)�31�T:�T�128�I�I�1:PF%(I)�IS �� �T�48�T�64�I�MX�PF%(I)�PF%(I�1):�T�49�I�I�1:T�T�1:�150 �� I�I�1:X�X�1:�X���(LV$)�I�MX� 140 �� FU�0:TU�1:� UNDO UNDERFLOW TRIGGER � � X�0 � MU:UD%(X,2)�FU:� X � UD�0:DL�0 � �"�"; 5� � BEGIN MAIN LOOP T� � WIN � WIN�0:L%�L%�1:�115 f� � BUILD RULES �� � X�0 � 7:RU%(X)�0:TR%(X)�0:� X �� � 53280,5 �� � X�1 � MX�1 �� �PF%(X) �IS � � 600 �� � TODO: HAS/AND OR OTHER VERBS �� � X:� 53280,3 � RU%(0)�0 � U�0:WIN�0:� CK�0�MX 2� N�PF%(CK):�N�0�295 g�(N�24)�0��TR%(N�7)��TR%(N�7)��(N�7) � �700:� FG �	�N�32��TR%(N�32)��TR%(N�32)���(N�32) � �720:� BG �R�RU%(N�31)�RU%(N�32) ��(R�48)�48 � NP�0:� 765:�295:� OPEN-SHUT DESTROYS BOTH �(R�64)�64�� PF%(CK)�32 �NP�0:�765:� SINK N�(R�768)�768� DR�512:� 785:�295:� HOT/MELT |�(R�129)�129 � DR�1:� 785:�295:� YOU/LOSE �"�R�1�U%(U)�CK:U�U�1:�R�2�WIN�1 �'�CK:�500:TU�TU�1:� 53280,14 �,� 900:� DRAW SCREEN 1�646,14:TU�TU�TD:TD�0:� MOVE TO USER INPUT 46� U�0 � �"NOTHING IS YOU. Z=UNDO R=RESET" e;� WIN � �"CONGRATULATIONS. PRESS N FOR NEXT" ���TU"�?    �����";:�198,15:�K$ ��� K$�"R" � 125:� RESET ��� �(K$�".")"� �" ��� K$�"N" � L%�L%�1:� 115:� ADVANCE ��� K$�"Z" � 2000:� UNDO �� K$�"P" � 2150:� POKE 5�� K$�"D" � 2055:� PRINT DATA \�� K$�"G" � �"�GOTO LEVEL";L%:� 115 y�� K$�"E" � 2200:� EDITOR ��� SEND INPUT TO EACH YOU-TILE ��� U�0 � � 1000:� 450 ���500:� 200 ��� APPLY DELTAS AND CONVERT TO UNDO ��� UD�DL � � �� TURN DELTA INTO UNDO %X�UD%(UD,0) GNP�UD%(UD,1):UD%(UD,1)�PF%(X) x	�(NP�31)��(NP�32) � NP�NP�31:� ABSORB DOULES �
PF%(X)�NP �UD�UD�1:�UD�MU� UD�0 �� UD��DL � 515 �� TODO: SIGNAL WHETHER STACK HAS CHANGED �FU�UD%(UD,2) !� 200:� END OF MAIN LOOP X� "IS" -]� DX�1 � W � W�1 9bCK�X�DX Jg� CK�0 � 650 nlN�PF%(CK)�31:�(N � 24)��8 � 650 �qN�N � 7:CK�X�DX �v� CK�MX � 650 �{I�PF%(CK)�31 ���(I�24)�15 � RU%(N)�RU%(N)�2�(I�15):� PROPERTY ���(I�24)�8 � TR%(N)�I�7:� TRANSFORM �� DX �� !�� NOUN-IS-NOUN +�� 740 J�N�N�224�TR%(N�7):PF%(CK)�N P�� n�� NOUN-IS-NOUN BACKGROUND x�� 740 ��N�N�31�(TR%(N�32)�32):PF%(CK)�N ��� ��� PUSH TO UNDO STACK AFTER DELTA LOOP ALREADY RAN �UD%(UD,0)�CK:UD%(UD,1)�PF%(X):UD%(UD,2)�TU:TD�1 '�UD�UD�1:� UD�MU � UD�0 1�DL�UD 7�� V�� PUSH TO DELTA-UNDO STACK �UD%(DL,0)�CK:UD%(DL,1)�NP:UD%(DL,2)�TU �DL�DL�1:�DL�MU � DL�0 �� �� DESTROY OBJECT AT CK WITH RULE DR.  ORIGINAL VALUE IS N � RU%(N�31) � DR � NP�N�32:� 765 )� RU%(N�32) � DR � NP�N�31:� 765 / � @�� DRAWSCREEN h��"";:� N�0�MX:�GR$(PF%(N)�31);:� N n�� ��� PUT CURSOR AT X TILE ���""�X)�X)�X)�X); ��� ��� 2500 ��� OBJ AT X IS YOU ��U�U�1 ��DX�0:X�U%(U) ��� 2500:� GET DX �� DX�0 � � � X�DX�0 � X�DX�MX � � ?� OBJ AT X WANTS TO MOVE DX QDS�X�DX:CK�DS r�CK�0�CK�MX��:� STOP AT EDGE ���PP(CK)�8 � CK�CK�DX:� 1040:� PUSH PROPERTY ��PF%(CK)�24 � CK�CK�DX:� 1040:� PUSH TEXT ���PP(CK)�4� �:� STOP $�(�PP(CK)�64)�0 � 1065 %)� MOVE ALL TILES HEAD-FIRST 8.BG�PF%(CK)�224 e3�PF%(CK)�8��(�PP(CK)�44)�0�BG�PF%(CK)�32 �8NP�(PF%(CK�DX)�31)� BG:�765 �=� CK��DS � CK�CK�DX:� 1070 �BCK�CK�DX:NP�PF%(X)�32:� 765:� RESTORE BG �G� ��� "Z" FOR UNDO ��@ \FASTFOR:\FASTARRAY �TU�TU�1 .�� TU��FU � TU�FU�1:�2050 I�UD�UD�1:� UD�0 � UD�MU c��UD%(UD,2)��TU � 2040 ��UD%(UD,2)�FU:PF%(UD%(UD,0))�UD%(UD,1) ��� 2020 ��UD�UD�1:� UD�MU � UD�0 ��DL�UD �� 215 �� "D" FOR PRINT DATA �� MX�0 � � "CAN'T" � "79 DATA ";�(34); CK�0:X�0 /� X��MX � 2125 G NP�PF%(X):N�NP � 31 {%�X�MX�1��PF%(X�1)�IS � ��(192�N);:CK�X�2:� 2120 �*� �(64�N); �/� NP�31 � � �(35�NP�32); �4� RUN LENGTH DETECTION? �9CK�CK�1:� CK��MX � 2115 �>� PF%(CK)�NP � 2105 C�(CK�1)�X���(47�CK�X); "HX�CK:� 2075 7M� 646,14:� �(34) =R� Pf� "P" FOR POKE bk� "POKE";X,T$ �p�T$�""�X��0�X��MX�PF%(X)��(T$)�31:T$��(T$,2):X�X�1:�2160 �u� 200 ��� "E" FOR EDITOR ��X�0 ���"� F1�=LEGEND F3�=RESTORE F5�=SAVE F7�=QUIT" +��" CRSR�=MOVE A-Z�=SET SHIFT�+A-G�=BG" e�� 915:�"�>";�(64�PF%(X)�32);�(64�(PF%(X)�31));"�<�"; y��K$:�K$�""�2220 ��DX�0:�2500:� DX�0 � 2255 ��� 915:� GR$(PF%(X)�31); ��X�X�DX:� X�0 � X�X�MX ��� X��MX � X�X�MX ��� 2225  ��"?�";:�K$�"�"� 165:� BACK TO GAME (CLEAR UNDO) :�� K$�"�"� 2445:� SAVE T�� K$�"�"� 2470:� LOAD }�� K$�"�"� � 2400:� 900:� 2205:� HELP ��� K$�" " � PF%(X)�0:�2220 ��N��(K$) ��� N�20 � PF%(X)�PF%(X)�32:�2220 ���(N�224)�64 � PF%(X)�(PF%(X)�224)�(N�31):�2220 5��(N�248)�192 � PF%(X)�(PF%(X)�31)�((N�7)�32):�2220 @�� 2225 Z`	� EDITOR "?" FOR HELP de	�"�"; qj	� I�0�15 �o	� " �";�(I�64);" ";GR$(I); �t	� �20);" �";�(I�80);" ";GR$(I�16) �y	� I �~	� "  PRESS ANY KEY TO RETURN" ��	�K$:�K$�""�2435 ��	� �	� EDITOR "F5" SAVE TO MEMORY 5�	� 53281,14:� 53280,1 Y�	� CK�0 � MX�1:� SM�CK,PF%(CK):� r�	� 53281,6:� 53280,14 }�	� 2220 ��	� EDITOR "F3" LOAD FROM MEMORY ��	� 53281,14:� 53280,1 ��	� CK�0 � MX�1:PF%(CK)��(SM�CK):� ��	� 53281,6:� 53280,14 �	� 900:� 2205  �	�@ \DATATYPE STRING ?�	� CALCULATE DX BASED ON K$ Q�	� K$�""�DX�1 d�	� K$�"�"�DX��1 v�	� K$�""�DX�W ��	� K$�"�"�DX��W ��	� �(#� OBJS 0-7 �2#� "�....",".��." �<#� "������","������" �F#� "� θ ","�////" �P#� "� ײ ","� -В"  Z#� NAMES 8-15  d#� "","�BABA" 7 n#� "�ROCK","�WALL" O x#� "�FLAG","�WATR" g �#� "�KEY ","�DOOR" � �#� PROPERTIES/VERBS 16-31 � �#� PROPERTY IS RU%(OBJ) AND... � �#� "�YOU �":� 1 � �#� "�WIN!�":� 2 � �#� "�STOP�":� 4 � �#� "�PUSH�":� 8 !�#� "�SHUT�":� 16  !�#� "�OPEN�":� 32 5!�#� "�SINK�":� 64 K!�#� "�LOSE�":� 128 a!�#� "�HOT �":� 256 w!�#� "�MELT�":� 512 �!$� "� 26 �":� 1024 �!$� "� 27 �":� 2048 �!$� "� 28 �":� 4096 �!"$� "� 29 �":� 8192 �!,$� "�HAS","� IS " "6$� LEVEL DATA - USE "D" TO CREATE H"@$� "@:�P@1�R@;C7@1E3BE@3EAE1BE1D@1E3BE@3C7@;�Q@1�S@9" �"J$� "@:�P@1�R@;C8@4C@4EAEFGE1D@5C@4C8@�Q@1�S@1�T@1�U@9" �"T$� "@:�P@1�R@;C8@4E@5A@BE@1D@5E@4C8@�Q@1�S@1�V@>"   