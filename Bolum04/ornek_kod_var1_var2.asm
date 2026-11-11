; Degisken adlari bagil konumla degisir: MOV AL, var1 -> MOV AL, [0108h]; adlar harf
; buyuklugune duyarsizdir (VAR1 = var1).
; Sunum 4.2 Degiskenler, slaytlar "Örnek Kod" ve "Örnek Kodu İzleme" (ayni kod).
ORG 100h
MOV AL, var1   ; AL ← var1
MOV BX, var2   ; BX ← var2
RET            ; programı bitir
VAR1 DB 7      ; BYTE, 7
var2 DW 1234h  ; WORD, 1234h

; YAZMACLAR: AL BX
; BELLEK: var1 3

; Beklenen cikti:
; AL=07h
; BX=1234h
; var1: 07h 34h 12h
