; LOOP ile dizi elemanlarını toplama: 5 + 4 + 5 + 2 + 1 = 17 = 11h, sonuç m'de.
; Sunum: Bölüm 7 Akış Kontrolü, slayt "Dizi Elemanları Toplamı".
org 100h
mov cx, 5           ; eleman sayısı
mov al, 0           ; toplam (AL) = 0
mov bx, 0           ; BX = indis
next:
add al, vector[bx]  ; elemanı topla
inc bx              ; sonraki eleman
loop next           ; CX = 0 olana kadar dön
mov m, al           ; sonucu m'ye yaz
ret
vector db 5, 4, 5, 2, 1
m db 0

; YAZMACLAR: AL BX
; BELLEK: m 1
; Beklenen cikti:
; AL=11h
; BX=0005h
; m: 11h
