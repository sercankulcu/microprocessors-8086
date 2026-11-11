; Etiket iceren makro iki kez kullanilinca ayni etiket iki kez tanimlanir.
; Sunumdaki hatali makro (derlenmez: emu8086'da "Duplicate declaration"):
;
;   BEKLE MACRO
;   ilk:  DEC CX
;         JNZ ilk
;   ENDM
;
;   MOV CX, 5
;   BEKLE
;   MOV CX, 9
;   BEKLE
;
; Derleyicinin gordugu:
;
;   MOV CX, 5
;   ilk:  DEC CX    ; 1. kopya
;         JNZ ilk
;   MOV CX, 9
;   ilk:  DEC CX    ; 2. kopya !
;         JNZ ilk
;
; Asagida duzeltilmis hali: LOCAL ilk, govdenin ilk satiri; her acilimda ilk yeni bir ad
; (??0000, ??0001) alir. Sunum 9.1 "Etiket Sorunu" (iki slayt), "LOCAL Direktifi".

BEKLE MACRO
      LOCAL ilk           ; sunumda yok: duzeltme (kod izleme slaytindaki "Makroda LOCAL ilk var")
ilk:  DEC CX
      JNZ ilk
ENDM

ORG 100h                  ; sunumda yok
MOV CX, 5
BEKLE
MOV CX, 9
BEKLE
RET                       ; sunumda yok

; YAZMACLAR: CX ZF
; Beklenen cikti:
; CX=0000h
; ZF=1
