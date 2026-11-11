; INT 10h AH = 06h (AL = 0) ile ekranı mavi zemine temizlemek ve ortada 10 × 40'lık
; kırmızı bir kutu açmak. Renkler (öznitelikler) deneme çıktısında görünmez.
; Kaynak: Bölüm 5.2 sunumu, "AH = 06h: Ekranı Temizle" ve "AH = 06h ile Pencere: Kod İzleme".
; YAZMACLAR: AX BH CX DX
org 100h
mov ax, 0600h   ; AH=06h, AL=0
mov bh, 1Fh     ; mavi/beyaz
mov cx, 0000h   ; (0,0)
mov dx, 184Fh   ; (24,79)
int 10h
mov ax, 0600h
mov bh, 4Fh     ; kırmızı/beyaz
mov cx, 0714h   ; (7,20)
mov dx, 103Bh   ; (16,59)
int 10h
ret

; Beklenen cikti:
; AX=0600h
; BH=4Fh
; CX=0714h
; DX=103Bh
