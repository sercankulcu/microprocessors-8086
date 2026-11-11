; LEA BX, VAR1 yerine MOV BX, OFFSET VAR1: ayni sonuc, derleme anindaki sabit adres.
; Sunum 4.2 Degiskenler, slayt "LEA ve OFFSET Aynı mı?".
ORG 100h
MOV AL, VAR1
MOV BX, OFFSET VAR1
MOV BYTE PTR [BX], 44h
MOV AL, VAR1
RET
VAR1 DB 22h
END

; YAZMACLAR: AL BX
; BELLEK: VAR1 1

; Beklenen cikti:
; AL=44h
; BX=010Dh
; VAR1: 44h
