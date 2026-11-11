; x = a + b makine kodu: A1 00 02 | 03 06 02 02 | A3 04 02 | C3 (11 bayt).
; Varsayım (sunumdaki gibi): a = 0015h (21) 0200h'de, b = 0027h (39) 0202h'de.
; Kaynak: Bölüm 3.1 Programlama Dilleri, "x = a + b: Makine Kodu İzleme"

kod EQU 0100h     ; sunumda yok: BELLEK yönergesi için kodun başı

org 100h
mov ax, [0200h]   ; A1 00 02
add ax, [0202h]   ; 03 06 02 02
mov [0204h], ax   ; A3 04 02
ret               ; C3

org 0200h         ; sunumda yok: sunumdaki veri
a dw 0015h        ; sunumda yok
b dw 0027h        ; sunumda yok
x dw ?            ; sunumda yok

; YAZMACLAR: AX
; BELLEK: kod 11
; BELLEK: x 2

; Beklenen cikti:
; AX=003Ch
; kod: A1h 00h 02h 03h 06h 02h 02h A3h 04h 02h C3h
; x: 3Ch 00h
