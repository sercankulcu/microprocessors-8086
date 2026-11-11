; Yazmactan bellege: MOV [2000h], BX -> [2000h] = 34h, [2001h] = 12h.
; Sunum 4.1 Bellek Erisimi, slayt "Yazmaçtan Belleğe".
ORG 100h
MOV BX, 1234h     ; BB 34 12
MOV [2000h], BX   ; 89 1E 00 20
RET
adres EQU 2000h   ; sunumda yok: BELLEK yonergesi icin ad

; YAZMACLAR: BX
; BELLEK: adres 2

; Beklenen cikti:
; BX=1234h
; adres: 34h 12h
