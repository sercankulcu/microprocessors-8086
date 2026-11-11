; AAM: çarpmadan sonra AL'yi iki paketsiz basamağa ayırmak. 7 × 8 = 56 → AH = 5, AL = 6.
; Kaynak: Bölüm 6 sunumu, "AAM ve AAD" (ilk örnek).
; YAZMACLAR: AX
org 100h    ; sunumda yok: .COM programı
mov al, 7
mov bl, 8
mul bl      ; AX = 0038h (56)
aam         ; AH = 05h, AL = 06h
ret         ; sunumda yok: programı bitir

; Beklenen cikti:
; AX=0506h
