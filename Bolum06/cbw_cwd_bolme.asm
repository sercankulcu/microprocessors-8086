; Bölmeye hazırlık: işaretsizde DX sıfırlanır (1000 / 7 = 142, kalan 6), işaretlide CWD ile
; işaret genişletilir (-1000 / 7 = -142, kalan -6). İşaretsiz sonuç BX'in yanına saklanmaz;
; son yazmaçlar işaretli bölmenindir.
; Kaynak: Bölüm 6 sunumu, "Bölmeye Hazırlık: CBW, CWD".
; YAZMACLAR: AX DX
org 100h        ; sunumda yok: .COM programı
; işaretsiz: 1000 / 7
mov ax, 1000
xor dx, dx      ; DX:AX = 1000
mov bx, 7
div bx          ; AX = 142, DX = 6

; işaretli: -1000 / 7
mov ax, -1000
cwd             ; DX = FFFFh
idiv bx         ; AX = -142, DX = -6
ret             ; sunumda yok: programı bitir

; Beklenen cikti:
; AX=FF72h
; DX=FFFAh
