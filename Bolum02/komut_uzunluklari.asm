; Komut uzunlukları: 8086 komutları 1 ile 6 bayt arasındadır. Altı komut 15 bayt tutar:
; 41 | BB 50 40 | 8B C3 | 04 7C | C7 87 34 12 78 56 | C3
; Kaynak: Bölüm 2.1 8086 Mimarisi, "Komut Uzunlukları: Kod İzleme"

kod  EQU 0100h           ; sunumda yok: BELLEK yönergesi için kodun başı
veri EQU 5284h           ; sunumda yok: BELLEK yönergesi için EA = 4050h + 1234h

org 100h
inc cx
mov bx, 4050h
mov ax, bx
add al, 7Ch
mov word ptr [bx+1234h], 5678h
ret

; YAZMACLAR: AX BX CX
; BELLEK: kod 15
; BELLEK: veri 2

; Beklenen cikti (CX başlangıçta 0 sayılır):
; AX=40CCh
; BX=4050h
; CX=0001h
; kod: 41h BBh 50h 40h 8Bh C3h 04h 7Ch C7h 87h 34h 12h 78h 56h C3h
; veri: 78h 56h
