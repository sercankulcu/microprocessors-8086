; $ ile dizi boyu (n EQU $ - dizi) ve LOOP ile en buyuk elemani bulma (JAE: isaretsiz).
; Sunum 4.2 Degiskenler, slayt "Dizi Boyutuyla Döngü: Kod İzleme".
ORG 100h
JMP basla
dizi DB 12, 47, 5, 31
n EQU $ - dizi     ; 4
enb DB ?
basla:
MOV CX, n          ; CX = 4
MOV SI, 0
MOV AL, dizi[SI]   ; ilk aday
bak:
CMP AL, dizi[SI]
JAE gec            ; AL >= eleman
MOV AL, dizi[SI]   ; yeni aday
gec:
INC SI
LOOP bak
MOV enb, AL
RET

; YAZMACLAR: AL CX SI
; BELLEK: enb 1

; Beklenen cikti:
; AL=2Fh
; CX=0000h
; SI=0004h
; enb: 2Fh
