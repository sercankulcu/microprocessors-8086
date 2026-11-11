; MyMacro2'nin AX = 2 icin acilimi: label1 -> ??0000, label2 -> ??0001.
; CMP AX, 2 -> ZF = 1, JE ??0000; INC AX -> 3; ADD AX, 2 -> 5.
; Sunum 9.1 "MyMacro2 Calisirken".
ORG 100h
MOV  AX, 2       ; MyMacro2 öncesi
CMP  AX, 2       ; MyMacro2 başlar
JE   ??0000
CMP  AX, 3
JE   ??0001
??0000:
INC  AX
??0001:
ADD  AX, 2       ; MyMacro2 biter
RET

; YAZMACLAR: AX
; Beklenen cikti:
; AX=0005h
