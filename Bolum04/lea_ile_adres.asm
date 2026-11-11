; LEA degiskenin adresini verir; degiskene adiyla da [BX] isaretcisiyle de erisilir.
; Sunum 4.2 Degiskenler, slayt "LEA ile Adres".
ORG 100h
MOV AL, VAR1          ; değer
LEA BX, VAR1          ; adres
MOV BYTE PTR [BX], 44h
MOV AL, VAR1          ; yeni değer
RET
VAR1 DB 22h
END

; YAZMACLAR: AL BX
; BELLEK: VAR1 1

; Beklenen cikti:
; AL=44h
; BX=010Dh
; VAR1: 44h
