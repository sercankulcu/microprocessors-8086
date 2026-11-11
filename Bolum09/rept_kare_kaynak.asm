; Ayni kare tablosu REPT ile derlemede uretilir (slayt notundaki "Tablonun kaynagi":
; n = 0 / kare LABEL BYTE / REPT 8 / DB n*n / n = n + 1 / ENDM). = ile tanimlanan sembol
; her turda yeni deger alir. Sunum 9.1 "REPT ile Tablo: Kod Izleme".
org 100h
lea  bx, kare
mov  al, 5
xlat           ; AL = kare[5]
mov  dl, al
mov  al, 7
xlat           ; AL = kare[7]
add  al, dl
ret
n = 0
kare LABEL BYTE
REPT 8
  DB n*n
  n = n + 1
ENDM

; YAZMACLAR: AL DL
; BELLEK: kare 8
; Beklenen cikti:
; AL=4Ah
; DL=19h
; kare: 00h 01h 04h 09h 10h 19h 24h 31h
