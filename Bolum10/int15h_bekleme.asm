; INT 15h, AH = 86h: CX:DX mikrosaniye bekler. 5 000 000 us = 004C4B40h -> CX = 004Ch,
; DX = 4B40h. Basarida CF = 0 (test ortaminda sure gecmis sayilir).
; Kaynak: Bolum 10.2 Aygit Kontrolu, "INT 15h ile Bekleme"
; YAZMACLAR: CX DX CF

ORG 100h       ; sunumda yok
; 5 saniye bekle (5 milyon µs)
mov cx, 4Ch    ; 004C4B40h = 5 000 000
mov dx, 4B40h
mov ah, 86h
int 15h
ret            ; sunumda yok

; Beklenen cikti:
; CX=004Ch
; DX=4B40h
; CF=0
