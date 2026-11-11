; Aynı işlem üç düzeyde: C'deki x = a + b; assembly'de üç komuttur.
; Sunumdaki makine dili sütunu a = 0200h, b = 0202h, x = 0204h adreslerini kullanır;
; değişkenler burada o adreslere konur. a = 0015h (21), b = 0027h (39) -> x = 003Ch (60).
; Kaynak: Bölüm 3.1 Programlama Dilleri, "Aynı İşlem Üç Düzeyde"

org 100h        ; sunumda yok: .COM programı
MOV AX, [a]     ; a'yı AX yazmacına yükle
ADD AX, [b]     ; AX = AX + b
MOV [x], AX     ; sonucu x'e yaz
RET             ; sunumda yok: DOS'a dön

org 0200h       ; sunumda yok: değişkenler sunumdaki adreslerde
a dw 0015h      ; sunumda yok
b dw 0027h      ; sunumda yok
x dw ?          ; sunumda yok

; YAZMACLAR: AX
; BELLEK: x 2

; Beklenen cikti:
; AX=003Ch
; x: 3Ch 00h
