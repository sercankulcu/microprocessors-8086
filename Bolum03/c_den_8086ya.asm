; C'den 8086'ya: while (i > 0) { toplam += i; i -= 3; } döngüsü CMP + JLE + JMP olur.
; toplam = 10 + 7 + 4 + 1 = 22 = 0016h; döngü i = -2 (FFFEh) olunca biter.
; Kaynak: Bölüm 3.1 Programlama Dilleri, "C'den 8086'ya: Kod İzleme"

org 100h
mov bx, 0         ; toplam = 0
mov cx, 10        ; i = 10
kosul: cmp cx, 0  ; i > 0 ?
jle bitti
add bx, cx        ; toplam += i
sub cx, 3         ; i -= 3
jmp kosul
bitti: mov toplam, bx
ret
toplam dw ?

; YAZMACLAR: BX CX
; BELLEK: toplam 2

; Beklenen cikti:
; BX=0016h
; CX=FFFEh
; toplam: 16h 00h
