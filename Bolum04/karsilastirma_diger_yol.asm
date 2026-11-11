; Ayni program, diger dal: value1 = 3, value2 = 7 -> JGE atlamaz, buyuk olan value2.
; Sunum 4.2 Degiskenler, slayt "Karşılaştırma: Diğer Yol".
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
value1 DW 3
value2 DW 7
max_value DW ?

; YAZMACLAR: AX CF ZF SF OF
; BELLEK: max_value 2

; Beklenen cikti:
; AX=0007h
; CF=1
; ZF=0
; SF=1
; OF=0
; max_value: 07h 00h
