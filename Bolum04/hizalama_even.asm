; EVEN konum sayacini cift sayiya yuvarlar: a 0200h'de, araya bir dolgu bayti, w 0202h'de.
; Sunum 4.2 Degiskenler, slayt "Hizalama ve EVEN".
ORG 100h         ; sunumda yok
MOV BX, OFFSET w ; sunumda yok: w'nin bagil konumu
RET              ; sunumda yok
ORG 200h         ; sunumda yok: slayttaki adresler
a  DB 5          ; 0200h
   EVEN          ; 0201h: dolgu
w  DW 1234h      ; 0202h (çift)

; YAZMACLAR: BX
; BELLEK: a 4

; Beklenen cikti:
; BX=0202h
; a: 05h 90h 34h 12h
