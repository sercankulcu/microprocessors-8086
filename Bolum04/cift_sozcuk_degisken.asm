; DD, iki DW, dort DB ve ikili DD ayni dort bayti (78 56 34 12) uretir; DX:AX'e yukleme.
; Sunum 4.2 Degiskenler, slayt "Çift Sözcük Değişken".
org 100h
jmp start
mydouble dd 12345678h  ; double word
mywords  dw 5678h      ; 2 ayrı word
         dw 1234h
mybytes  db 78h        ; 4 ayrı byte
         db 56h
         db 34h
         db 12h
data dd 00010010001101000101011001111000b
start:  ; data'yı DX:AX'e yükle
mov ax, word ptr data
mov dx, word ptr [data+2]
ret

; YAZMACLAR: DX AX
; BELLEK: mydouble 4
; BELLEK: mywords 4
; BELLEK: mybytes 4
; BELLEK: data 4

; Beklenen cikti:
; DX=1234h
; AX=5678h
; mydouble: 78h 56h 34h 12h
; mywords: 78h 56h 34h 12h
; mybytes: 78h 56h 34h 12h
; data: 78h 56h 34h 12h
