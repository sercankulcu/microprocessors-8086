; TOPLA makrosu: parametre bellek degiskeni ya da sabit olabilir.
; TOPLA a, b, c ve TOPLA c, 5, d: c = 1545h, d = 154Ah.
; Sunum 9.1 "Parametre Turleri" (tanim), kullanim ve veriler "TOPLA Makrosu: Kod Izleme"den.

TOPLA MACRO x, y, z
  MOV AX, x
  ADD AX, y
  MOV z, AX
ENDM

OPTION NOKEYWORD:<C>     ; sunumda yok: MASM/UASM'da C ayrilmis sozcuk (dil turu); emu8086'da degil
org 100h                 ; sunumda yok: kullanim kod izleme slaytindan
TOPLA a, b, c
TOPLA c, 5, d
ret
a dw 1200h
b dw 0345h
c dw ?
d dw ?

; YAZMACLAR: AX
; BELLEK: c 2
; BELLEK: d 2
; Beklenen cikti:
; AX=154Ah
; c: 45h 15h
; d: 4Ah 15h
