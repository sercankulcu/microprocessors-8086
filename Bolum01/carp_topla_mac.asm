; Çarp-topla (MAC): y = 2*10 + 3*20 + 1*30 = 110. Her terim için ayrı MUL ve ADD;
; DSP bunu tek MAC komutuyla yapar.
; Kaynak: Bölüm 1.1 Giriş, "Çarp-Topla (MAC): Kod İzleme"

org 100h
mov si, 0
mov bx, 0        ; toplam
mov cx, 3        ; terim sayısı
dongu: mov al, h[si]
mul x[si]        ; AX = h × x
add bx, ax       ; toplama ekle
inc si
loop dongu
ret
h db 2, 3, 1
x db 10, 20, 30

; YAZMACLAR: BX AX

; Beklenen cikti:
; BX=006Eh
; AX=001Eh
