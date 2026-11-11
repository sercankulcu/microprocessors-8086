; FFh 255 mi, -1 mi? Bit desenini ADD (isaretsiz, CF) ya da CBW/NEG (isaretli) yorumlar.
; Sunum 4.2 Degiskenler, slayt "Değer Aralıkları: Kod İzleme".
; Ara adim (ADD AL, 1 sonrasi): AL = 00h, CF = 1, OF = 0, ZF = 1.
ORG 100h
MOV AL, x        ; FFh
ADD AL, 1        ; 255 + 1 ?
MOV AL, x
CBW              ; işaretli: −1
MOV BX, y        ; FFFEh
NEG BX           ; −(−2)
RET
x DB -1
y DW -2

; YAZMACLAR: AX BX CF OF ZF
; BELLEK: x 3

; Beklenen cikti:
; AX=FFFFh
; BX=0002h
; CF=1
; OF=0
; ZF=0
; x: FFh FEh FFh
