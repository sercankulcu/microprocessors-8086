; LEA SI, a[BX] adresi calisma aninda hesaplar; OFFSET a sabittir, BX ayrica eklenir.
; Sunum 4.2 Degiskenler, slayt "LEA ve OFFSET: Kod İzleme".
ORG 100h
MOV BX, 2
LEA SI, a[BX]      ; SI = a + BX
MOV DI, OFFSET a   ; sabit adres
ADD DI, BX         ; elle ekle
MOV AL, [SI]
INC BX
LEA SI, a[BX]      ; yeni adres
MOV AH, [SI]
RET
a DB 'ABCD'

; YAZMACLAR: AX BX SI DI

; Beklenen cikti:
; AX=4443h
; BX=0003h
; SI=0119h
; DI=0118h
