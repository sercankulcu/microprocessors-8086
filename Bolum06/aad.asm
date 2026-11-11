; AAD: bölmeden önce paketsiz "54"ü ikiliye (36h) çevirmek, sonra 54 / 6 = 9.
; Kaynak: Bölüm 6 sunumu, "AAM ve AAD" (ikinci örnek).
; YAZMACLAR: AX
org 100h       ; sunumda yok: .COM programı
mov ax, 0504h  ; '54' paketsiz
aad            ; AX = 0036h (54)
mov bl, 6
div bl         ; AL = 09h, AH = 00h
ret            ; sunumda yok: programı bitir

; Beklenen cikti:
; AX=0009h
