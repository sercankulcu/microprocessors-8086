; LOOPNE ile dizide arama: 3 değeri dizi[2]'de bulunur, döngü 3 turda biter (AL = 1, SI = 2).
; Sunum: Bölüm 7 Akış Kontrolü, slayt "LOOPNE ile Arama".
org 100h
mov cx, 5          ; eleman sayısı
mov si, -1         ; ilk inc ile 0 olur
ara:
inc si             ; sonraki eleman
cmp dizi[si], 3    ; aranan değer 3 mü?
loopne ara         ; CX≠0 ve ZF=0 ise sürdür
jne yok            ; ZF=0 → bulunamadı
mov al, 1          ; bulundu, konum SI'da
ret
yok:
mov al, 0          ; bulunamadı
ret
dizi db 7, 1, 3, 9, 4

; YAZMACLAR: AL SI CX ZF
; Beklenen cikti:
; AL=01h
; SI=0002h
; CX=0002h
; ZF=1
