; Degiskenden degiskene tasima bir yazmac uzerinden yapilir; jmp start veriyi atlar.
; Sunum 4.2 Degiskenler, slayt "Değişkenler Arasında Taşıma".
ORG 100h
jmp start
value1 DW 10    ; 2 baytlık değişken
value2 DW 0     ; ikinci değişken
start:
MOV AX, value1  ; AX ← value1
MOV value2, AX  ; value2 ← AX
RET
end start

; YAZMACLAR: AX
; BELLEK: value2 2

; Beklenen cikti:
; AX=000Ah
; value2: 0Ah 00h
