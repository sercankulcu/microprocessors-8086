; Parametre tuzagi: MyMacro BX, AX, 0 acilinca ilk MOV AX, BX ikinci satirin okuyacagi
; AX'i bozar; 1111h kaybolur, AX = BX = 2222h olur. Sunum 9.1 "Parametre Tuzagi".
ORG 100h
MOV  AX, 1111h
MOV  BX, 2222h
MOV  AX, BX  ; MyMacro BX,AX,0
MOV  BX, AX  ; p2 = AX (bozuk!)
MOV  CX, 0
RET

; YAZMACLAR: AX BX CX
; Beklenen cikti:
; AX=2222h
; BX=2222h
; CX=0000h
