; MyMacro makrosu: tanim ve iki kullanim (sabitler ve bir yazmac parametre olarak).
; Derleyici her cagriyi uc MOV komutuna acar; calisma aninda CALL/RET yoktur.
; Sunum 9.1 "Makro Tanimlama", "Makro Genisletme".

MyMacro  MACRO  p1, p2, p3
         MOV AX, p1
         MOV BX, p2
         MOV CX, p3
ENDM

ORG 100h                 ; sunumda yok: COM programi
MyMacro 1, 2, 3
MyMacro 4, 5, DX
RET                      ; sunumda yok: acilim listesinin sonundaki RET

; DX baslangicta 0 oldugu icin CX = 0.
; YAZMACLAR: AX BX CX
; Beklenen cikti:
; AX=0004h
; BX=0005h
; CX=0000h
