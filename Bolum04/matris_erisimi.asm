; Satir oncelikli bayt matrisi: mat[bx+si], BX satir basi (satir x 4), SI sutun.
; Sunum 4.1 Bellek Erisimi, slayt "Matris Erişimi: Kod İzleme".
org 100h
mov bx, 2*4          ; satır 2
mov si, 1            ; sütun 1
mov al, mat[bx+si]   ; mat[2][1]
mov si, 3            ; sütun 3
mov ah, mat[bx+si]   ; mat[2][3]
sub bx, 4            ; satır 1
mov dl, mat[bx+si]   ; mat[1][3]
ret
mat db 11h,12h,13h,14h
    db 21h,22h,23h,24h
    db 31h,32h,33h,34h

; YAZMACLAR: AX DL BX SI

; Beklenen cikti:
; AX=3432h
; DL=24h
; BX=0004h
; SI=0003h
