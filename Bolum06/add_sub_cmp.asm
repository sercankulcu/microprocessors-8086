; ADD, SUB ve CMP'nin bayraklara etkisi; CMP yalnızca bayrakları değiştirir.
; Kaynak: Bölüm 6 sunumu, "Kod İzleme: ADD, SUB, CMP".
; YAZMACLAR: AL BL CF ZF SF OF
org 100h         ; sunumda yok: .COM programı
mov al, 0F0h     ; 240
add al, 20h      ; 240 + 32 = 272
mov bl, 7
sub bl, 9        ; 7 - 9
cmp al, 10h      ; AL - 10h
cmp bl, 0
add bl, 2        ; FEh + 2
ret              ; sunumda yok: programı bitir

; Beklenen cikti:
; AL=10h
; BL=00h
; CF=1
; ZF=1
; SF=0
; OF=0
