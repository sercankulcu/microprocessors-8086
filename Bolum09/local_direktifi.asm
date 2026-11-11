; LOCAL direktifi: MyMacro2 uc kez kullanilir, label1/label2 her acilimda yeni ad alir.
; AX = 2 -> label1: INC + ADD -> 5; AX = 3 -> label2: ADD -> 5; AX = 7 -> 10.
; Sunum 9.1 "LOCAL Direktifi" (tanim); degerler "MyMacro2 Calisirken" slaytindan.

MyMacro2 MACRO
    LOCAL label1, label2
    CMP  AX, 2
    JE   label1
    CMP  AX, 3
    JE   label2
label1:
    INC  AX
label2:
    ADD  AX, 2
ENDM

ORG 100h                 ; sunumda yok: uc kullanim
MOV  AX, 2               ; sunumda yok
MyMacro2
MOV  BX, AX              ; sunumda yok
MOV  AX, 3               ; sunumda yok
MyMacro2
MOV  CX, AX              ; sunumda yok
MOV  AX, 7               ; sunumda yok
MyMacro2
RET                      ; sunumda yok

; YAZMACLAR: BX CX AX
; Beklenen cikti:
; BX=0005h
; CX=0005h
; AX=000Ah
