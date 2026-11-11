; Skalar işlemcide c = a + b: her öğe için ayrı okuma, toplama, yazma ve döngü yükü.
; c = 13, 25, 37, 49; 4 toplama için 22 komut yürütülür.
; Kaynak: Bölüm 1.1 Giriş, "Skalar Döngü: Kod İzleme"

option nokeyword:<c>  ; sunumda yok: MASM/UASM'de C ayrılmış sözcüktür (dil türü); emu8086'da değildir
org 100h
mov si, 0
mov cx, 4
dongu: mov al, a[si]  ; bir öğe oku
add al, b[si]         ; bir toplama
mov c[si], al         ; bir öğe yaz
inc si
loop dongu
ret
a db 3, 5, 7, 9
b db 10, 20, 30, 40
c db 4 dup(0)

; YAZMACLAR: SI
; BELLEK: c 4

; Beklenen cikti:
; SI=0004h
; c: 0Dh 19h 25h 31h
