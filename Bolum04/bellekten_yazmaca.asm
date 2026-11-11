; Bellekten yazmaca: MOV AX, [1000h] iki bayti little-endian okur (CD AB -> ABCDh).
; Sunum 4.1 Bellek Erisimi, slayt "Bellekten Yazmaca".
ORG 100h
MOV AX, [1000h]   ; A1 00 10
RET
ORG 1000h         ; sunumda yok: izlemedeki bellek icerigi (DS:1000h = CD AB)
deger DB 0CDh, 0ABh   ; sunumda yok

; YAZMACLAR: AX

; Beklenen cikti:
; AX=ABCDh
