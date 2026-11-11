; Us alma makrosu: POWER b, e, r -> r = b^e. AX 1 ile baslar, e kez tabanla carpilir.
; base = 2, exponent = 3 -> result = 8. Sunum 9.1 "Us Alma Makrosu" (iki slayt).
POWER macro b, e, r
    mov ax, 1        ; geçici sonuç = 1
    mov cx, e        ; üs → CX
    mov bx, b        ; taban → BX
powerloop:
    mul bx           ; DX:AX = AX * BX
    loop powerloop   ; e kez tekrarla
    mov r, ax        ; sonucu yaz
endm

ORG 100h
start:
    POWER base, exponent, result
    ret
base     dw 2     ; taban
exponent dw 3     ; üs
result   dw ?     ; sonuç

; YAZMACLAR: AX CX DX
; BELLEK: result 2
; Beklenen cikti:
; AX=0008h
; CX=0000h
; DX=0000h
; result: 08h 00h
