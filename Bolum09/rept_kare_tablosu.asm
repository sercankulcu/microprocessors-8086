; Derlemede uretilen kare tablosu XLAT ile okunur: 5^2 + 7^2 = 25 + 49 = 74 (4Ah).
; Slaytta tablo acilmis haliyle (DB satiri) verilir; REPT ile uretilen surumu
; rept_kare_kaynak.asm'de. Sunum 9.1 "REPT ile Tablo: Kod Izleme".
org 100h
lea  bx, kare
mov  al, 5
xlat           ; AL = kare[5]
mov  dl, al
mov  al, 7
xlat           ; AL = kare[7]
add  al, dl
ret
kare db 0, 1, 4, 9, 16, 25, 36, 49

; Slayttaki gibi LEA BX, kare: BX = 010Eh.
; YAZMACLAR: AL BX DL
; Beklenen cikti:
; AL=4Ah
; BX=010Eh
; DL=19h
