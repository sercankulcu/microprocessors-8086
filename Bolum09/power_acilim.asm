; POWER base, exponent, result acilimi (kod 19 bayt: base 0113h, exponent 0115h,
; result 0117h). Sunum 9.1 "POWER Calisirken".
ORG 100h
mov ax, 1        ; POWER açılımı
mov cx, exponent
mov bx, base
powerloop:
mul bx
loop powerloop
mov result, ax
ret
base     dw 2    ; 0113h
exponent dw 3    ; 0115h
result   dw ?    ; 0117h

; YAZMACLAR: AX BX CX DX CF OF
; BELLEK: result 2
; Beklenen cikti:
; AX=0008h
; BX=0002h
; CX=0000h
; DX=0000h
; CF=0
; OF=0
; result: 08h 00h
