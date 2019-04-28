% �@ \CONSTANT W,H,MX,MU,ML,SM,IS C �@ \INTEGER FU,TU,UD,DX,R S �@ \BYTE TD � �@ \BYTE DS,N=FAST,I=FAST,X=FAST,CK=FAST � �@ \BYTE T,NP,U,PF%(,U%(,UD%(,TR%( � � \FASTFOR �	 � BABA IS C64 -- A DEMAKE -- BY NICK BENSEMA 2019 	
 W�10:H�18:MX�H�W�1:SM�49152:IS�31 (	 ML�5:� MAX LEVELS U	 MU�350:� MAX DELTAS/UNDOS (MORE THAN MX) s	 � PF%(MX):� PLAYFIELD MAP �	 � RU%(31),TR%(7):� RULES �	# � �PP(PF)�RU%(PF%(PF)�31) �	( � GR$(31):� GFX TILES 4X1 �	- � LV$(ML):� LEVEL DATA STRINGS 
2 � DELTA LOG TILE#,OLDVALUE,MOVE# $
7 � UD%(MU,2) G
< � U%(MX�1):� LIST OF YOU-TILES a
A � N�0�31:� GR$(N):� N {
F � N�1�ML:� LV$(N):� N �
d � INIT �
i � 53281,6:� 53272,21 �
n L%�1 �
s � L%�ML � � "�END OF GAME�":� �
x LV$�LV$(L%):�"��UNPACKING LEVEL"L% } � LEVEL SELECTED #� � X�0 � MX:PF%(X)�0:� X /� I�0:X�1 C� T��(�(LV$,X,1)) S� �T�255�T�34 �� �T��64 � PF%(I)�31�T:�T�128�I�I�1:PF%(I)�IS �� �T�32 � T�48 � I�MX � PF%(I)�0:I�I�1:T�T�1:� 147 �� �T�48�T�64�I�MX�PF%(I)�PF%(I�1):�T�49�I�I�1:T�T�1:�150 � I�I�1:X�X�1:�X���(LV$)�I�MX� 140 ?� FU�0:TU�1:� UNDO UNDERFLOW TRIGGER ^� � X�0 � MU:UD%(X,2)�FU:� X l� UD�0:DL�0 v� �"�"; �� � BEGIN MAIN LOOP �� � WIN � WIN�0:L%�L%�1:�115 �� � BUILD RULES �� � X�0 � 7:RU%(X)�0:TR%(X)�0:� X �� � 53280,5  � � X�1 � MX�1 � �PF%(X) �IS � � 600 ;� � TODO: HAS/AND OR OTHER VERBS M� � X:� 53280,3 Z� RU%(0)�0 r� U�0:WIN�0:� CK�0�MX �� N�PF%(CK):�N�0�295 ��(N�24)�0��TR%(N�7)��TR%(N�7)��(N�7) � �700:� FG �	�N�32��TR%(N�32)��TR%(N�32)���(N�32) � �720:� BG R�RU%(N�31)�RU%(N�32) H�(R�48)�48 � NP�0:� 765:�295:� OPEN-SHUT DESTROYS BOTH v�(R�64)�64�� PF%(CK)�32 �NP�0:�765:� SINK ��(R�768)�768� DR�512:� 785:�295:� HOT/MELT ��(R�129)�129 � DR�1:� 785:�295:� YOU/LOSE �"�R�1�U%(U)�CK:U�U�1:�R�2�WIN�1 '�CK:�500:� 53280,14 &,� 900:� DRAW SCREEN U1�646,14:TU�TU�TD:TD�0:� MOVE TO USER INPUT �6� U�0 � �"NOTHING IS YOU. Z=UNDO R=RESET" �;� WIN � �"CONGRATULATIONS. PRESS N FOR NEXT" ���TU"�?    �����";:�198,15:�K$ ��� K$�"R" � 125:� RESET �� �(K$�".")"� �" -�� K$�"N" � L%�L%�1:� 115:� ADVANCE H�� K$�"Z" � 2000:� UNDO c�� K$�"P" � 2150:� POKE ��� K$�"D" � 2055:� PRINT DATA ��� K$�"G" � �"�GOTO LEVEL";L%:� 115 ��� K$�"E" � 2200:� EDITOR ��� SEND INPUT TO EACH YOU-TILE �DX�0:� 2500:� DX�0 � U�0 � 465 +�� ASSUME DX NEVER CHANGES O�SU�(1�U)�(DX�0):SE�(1�U)�(DX�0) ~�X�U%(SU):� 1020:�SU��SE �SU�SU��(DX):� 460 ���500:� 200 ��� APPLY DELTAS AND CONVERT TO UNDO ��� UD�DL � � ��TD�1 ��� TURN DELTA INTO UNDO �X�UD%(UD,0) NP�UD%(UD,1):UD%(UD,1)�PF%(X) K	�(NP�31)��(NP�32) � NP�NP�31:� ABSORB DOULES Y
PF%(X)�NP rUD�UD�1:�UD�MU� UD�0 �� UD��DL � 515 �� TODO: SIGNAL WHETHER STACK HAS CHANGED �FU�UD%(UD,2) �!�:� END OF APPLYING DELTAS �X� "IS" ]� DX�1 � W � W�1 bCK�X�DX g� CK�0 � 650 ClN�PF%(CK)�31:�(N � 24)��8 � 650 WqN�N � 7:CK�X�DX iv� CK�MX � 650 z{I�PF%(CK)�31 ���(I�24)�15 � RU%(N)�RU%(N)�2�(I�15):� PROPERTY ���(I�24)�8 � TR%(N)�I�7:� TRANSFORM ��� DX ��� ��� NOUN-IS-NOUN  �� 740 �N�N�224�TR%(N�7):PF%(CK)�N %�� C�� NOUN-IS-NOUN BACKGROUND M�� 740 q�N�N�31�(TR%(N�32)�32):PF%(CK)�N w�� ��� PUSH TO UNDO STACK AFTER DELTA LOOP ALREADY RAN ��UD%(UD,0)�CK:UD%(UD,1)�PF%(X):UD%(UD,2)�TU:TD�1 ��UD�UD�1:� UD�MU � UD�0 �DL�UD �� +�� PUSH TO DELTA-UNDO STACK VUD%(DL,0)�CK:UD%(DL,1)�NP:UD%(DL,2)�TU pDL�DL�1:�DL�MU � DL�0 v� �� DESTROY OBJECT AT CK WITH RULE DR.  ORIGINAL VALUE IS N �� RU%(N�31) � DR � NP�N�32:� 765 �� RU%(N�32) � DR � NP�N�31:� 765  � �� DRAWSCREEN =��"";:� N�0�MX:�GR$(PF%(N)�31);:� N C�� ^�� PUT CURSOR AT X TILE t��""�X)�X)�X)�X); z�� ��� 2500 ��� OBJ AT X IS YOU ��U�U�1 ��DX�0:X�U%(U) ��� 2500:� GET DX ��� DX�0 � � �� X�DX�0 � X�DX�MX � � � OBJ AT X WANTS TO MOVE DX &DS�X�DX:CK�DS G�CK�0�CK�MX��:� STOP AT EDGE x��PP(CK)�8 � CK�CK�DX:� 1040:� PUSH PROPERTY ��PF%(CK)�24 � CK�CK�DX:� 1040:� PUSH TEXT ���PP(CK)�4� �:� STOP �$�(�PP(CK)�64)�0 � 1065 �)� MOVE ALL TILES HEAD-FIRST .BG�PF%(CK)�224 :3�PF%(CK)�8��(�PP(CK)�44)�0�BG�PF%(CK)�32 Z8NP�(PF%(CK�DX)�31)� BG:�765 y=� CK��DS � CK�CK�DX:� 1070 �BCK�CK�DX:NP�PF%(X)�32:� 765:� RESTORE BG �G� ��� "Z" FOR UNDO ���@ \FASTFOR:\FASTARRAY ��TU�TU�1:TD�0 �� TU��FU � TU�FU�1:�2050 #�UD�UD�1:� UD�0 � UD�MU =��UD%(UD,2)��TU � 2040 g�UD%(UD,2)�FU:PF%(UD%(UD,0))�UD%(UD,1) r�� 2020 ��UD�UD�1:� UD�MU � UD�0 ��DL�UD �� 215 �� "D" FOR PRINT DATA �� MX�0 � � "CAN'T" �� "9320D�";�(34); �CK�0:X�0 � X��MX � 2125  NP�PF%(X):N�NP � 31 S%�X�MX�1��PF%(X�1)�IS � ��(192�N);:CK�X�2:� 2120 b*� �(64�N); /� NP�31 � � �(35�NP�32); �4� RUN LENGTH DETECTION? �9CK�CK�1:� CK��MX � 2115 �>� PF%(CK)�NP � CK�X�16 � 2105 �C�(CK�1)�X ���(47�CK�X); $D�(CK�1)�X � NP�0 � � �(20)�(20)�(31�CK�X); ZE�(CK�3)�X � NP�0 � � �(20)�(255);:� REPL "�WITH � jHX�CK:� 2075 M� 646,14:� �(34) �R� �f� "P" FOR POKE �k� "POKE";X,T$ �p�T$�""�X��0�X��MX�PF%(X)��(T$)�31:T$��(T$,2):X�X�1:�2160 �u� 200 �� "E" FOR EDITOR �X�0 D��"� F1�=LEGEND F3�=RESTORE F5�=SAVE F7�=QUIT" s��" CRSR�=MOVE A-Z�=SET SHIFT�+A-G�=BG" ��� 915:�"�>";�(64�PF%(X)�32);�(64�(PF%(X)�31));"�<�"; ���K$:�K$�""�2220 ��DX�0:�2500:� DX�0 � 2255 ��� 915:� GR$(PF%(X)�31); �X�X�DX:� X�0 � X�X�MX )�� X��MX � X�X�MX 4�� 2225 h��"?�";:�K$�"�"� 165:� BACK TO GAME (CLEAR UNDO) ��� K$�"�"� 2445:� SAVE ��� K$�"�"� 2470:� LOAD ��� K$�"�"� � 2400:� 900:� 2205:� HELP ��� K$�" " � PF%(X)�0:�2220 ��N��(K$) �� N�20 � PF%(X)�PF%(X)�32:�2220 F��(N�224)�64 � PF%(X)�(PF%(X)�224)�(N�31):�2220 }��(N�248)�192 � PF%(X)�(PF%(X)�31)�((N�7)�32):�2220 ��� 2225 �`	� EDITOR "?" FOR HELP �e	�"�"; �j	� I�0�15 �o	� " �";�(I�64);" ";GR$(I); �t	� �20);" �";�(I�80);" ";GR$(I�16) y	� I )~	� "  PRESS ANY KEY TO RETURN" =�	�K$:�K$�""�2435 C�	� d�	� EDITOR "F5" SAVE TO MEMORY }�	� 53281,14:� 53280,1 ��	� CK�0 � MX�1:� SM�CK,PF%(CK):� ��	� 53281,6:� 53280,14 ��	� 2220 ��	� EDITOR "F3" LOAD FROM MEMORY  �	� 53281,14:� 53280,1 & �	� CK�0 � MX�1:PF%(CK)��(SM�CK):� ? �	� 53281,6:� 53280,14 P �	� 900:� 2205 h �	�@ \DATATYPE STRING � �	� CALCULATE DX BASED ON K$ � �	� K$�"" � K$�"L" �DX�1 � �	� K$�"�" � K$�"H" �DX��1 � �	� K$�"" � K$�"J" �DX�W � �	� K$�"�" � K$�"K" �DX��W � �	� !(#� OBJS 0-7 $!2#� "�....",".��." >!<#� "������","������" T!F#� "� θ ","�////" l!P#� "� ײ ","� -В" }!Z#� NAMES 8-15 �!d#� "","�BABA" �!n#� "�ROCK","�WALL" �!x#� "�FLAG","�WATR" �!�#� "�KEY ","�DOOR" �!�#� PROPERTIES/VERBS 16-31 "�#� PROPERTY IS RU%(OBJ) AND... *"�#� "�YOU �":� 1 >"�#� "�WIN!�":� 2 R"�#� "�STOP�":� 4 f"�#� "�PUSH�":� 8 {"�#� "�SHUT�":� 16 �"�#� "�OPEN�":� 32 �"�#� "�SINK�":� 64 �"�#� "�LOSE�":� 128 �"�#� "�HOT �":� 256 �"�#� "�MELT�":� 512 �"$� "� 26 �":� 1024 #$� "� 27 �":� 2048 ,#$� "� 28 �":� 4096 C#"$� "� 29 �":� 8192 Z#,$� "�HAS","� IS " #6$� LEVEL DATA - USE "D" TO CREATE �#@$�"*�P!�R+C7!E3BE#EAE1BE1D!E3BE#C7+�Q!�S" �#J$�"C?C7$C4��C4�Q@C1'C1@L!D�C1%A@C?C4*I@K&_�&P@R" $T$�"/�Q@C?�C6@D@C6�C;'C1@�R#C1'C1'C1@A%C1'C:*�P/(" X$^$�"�PC6�RC$C�VC@�S@C4$C4@A�C4!B1@C4E4C1(C(C(CE2%CE2!�Q@CDE1%C9" �$h$�"C4!�RC�C$C@A@C$C�C$C1BC1/��S!L(_E4#QE�E$E@D@E$E�E$E4/�C�PC/%�W"   