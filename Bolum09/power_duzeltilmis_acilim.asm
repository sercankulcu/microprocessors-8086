; Duzeltilmis POWER taban, us, sonuc acilimi: 7^2 = 49 (0031h); makro yalniz AX'i
; degistirir. Sunum 9.1 "Duzeltilmis POWER: Kod Izleme".
org 100h
mov  bx, 0AAAh   ; sunumda yok: slayttaki baslangic degerleri
mov  cx, 0BBBh   ; sunumda yok
mov  dx, 0CCCh   ; sunumda yok
push bx          ; POWER açılımı
push cx
push dx
mov  ax, 1
mov  cx, us
mov  bx, taban
jcxz ??0001      ; us = 0 → 1
??0000: mul bx
loop ??0000
??0001: mov sonuc, ax
pop  dx
pop  cx
pop  bx
ret
taban dw 7
us    dw 2
sonuc dw ?

; YAZMACLAR: AX BX CX DX
; BELLEK: sonuc 2
; Beklenen cikti:
; AX=0031h
; BX=0AAAh
; CX=0BBBh
; DX=0CCCh
; sonuc: 31h 00h
