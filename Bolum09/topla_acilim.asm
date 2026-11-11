; TOPLA a, b, c ve TOPLA c, 5, d cagrilarinin acilmis hali: ayni govde, baska metin.
; Sunum 9.1 "TOPLA Makrosu: Kod Izleme".
OPTION NOKEYWORD:<C>     ; sunumda yok: MASM/UASM'da C ayrilmis sozcuk (dil turu); emu8086'da degil
org 100h
mov ax, a      ; TOPLA a, b, c
add ax, b
mov c, ax
mov ax, c      ; TOPLA c, 5, d
add ax, 5
mov d, ax
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
