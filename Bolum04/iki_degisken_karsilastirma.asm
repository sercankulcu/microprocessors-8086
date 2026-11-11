; Iki degiskenden buyugunu bulma (CMP + JGE, isaretli): value1 = 10, value2 = 5.
; Sunum 4.2 Degiskenler, slayt "İki Değişkeni Karşılaştırma".
ORG 100h
MOV AX, value1     ; AX ← value1
CMP AX, value2     ; AX − value2
JGE greater_or_equal
MOV AX, value2     ; küçükse value2
JMP store_max
greater_or_equal:
MOV AX, value1
store_max:
MOV max_value, AX  ; sonucu sakla
RET
value1 DW 10
value2 DW 5
max_value DW ?

; YAZMACLAR: AX CF ZF SF OF
; BELLEK: max_value 2

; Beklenen cikti:
; AX=000Ah
; CF=0
; ZF=0
; SF=0
; OF=0
; max_value: 0Ah 00h
