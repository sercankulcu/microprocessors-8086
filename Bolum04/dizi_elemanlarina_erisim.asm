; Dizi elemanina sabit indisle (a[3]) ve indis yazmaciyla (a[SI]) erisim; a[1] <- 'E'.
; Sunum 4.2 Degiskenler, slayt "Dizi Elemanlarına Erişim".
ORG 100h       ; sunumda yok
MOV AL, a[3]   ; a + 3
MOV SI, 0
MOV BL, a[SI]  ; a + 0
INC SI
MOV BH, a[SI]  ; a + 1
MOV a[SI], 'E' ; a[1] ← 45h
RET
a DB 48h,65h,6Ch,6Ch,6Fh,0

; YAZMACLAR: AL BX SI
; BELLEK: a 6

; Beklenen cikti:
; AL=6Ch
; BX=6548h
; SI=0001h
; a: 48h 45h 6Ch 6Ch 6Fh 00h
