; JA ile işaretsiz karşılaştırma: 5 > 7 değil, CF = 1 olur ve not_jump_above dalı çalışır.
; Sunum: Bölüm 7 Akış Kontrolü, slayt "İşaretsiz Örnek".
org 100h          ; sunumda yok: .COM programı
mov ax, 5
mov bx, 7
cmp ax, bx
ja  jump_above
jmp not_jump_above
jump_above:       ; ax büyükse yapılacaklar
mov cx, 1         ; sunumda yok: hangi dalın çalıştığını göstermek için
jmp end_program
not_jump_above:   ; ax küçük veya eşitse
mov cx, 2         ; sunumda yok: hangi dalın çalıştığını göstermek için
end_program:
ret               ; sunumda yok: DOS'a dönüş

; YAZMACLAR: AX BX CX CF ZF
; Beklenen cikti:
; AX=0005h
; BX=0007h
; CX=0002h
; CF=1
; ZF=0
