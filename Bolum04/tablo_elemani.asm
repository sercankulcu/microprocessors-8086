; mat[satir][sutun] = mat + satir x SUTSAY + sutun; satir ve sutun degiskenlerden okunur.
; Sunum 4.2 Degiskenler, slayt "Tablo Elemanı: Kod İzleme".
SUTSAY EQU 4
ORG 100h
MOV AL, satir      ; AL = 2
MOV BL, SUTSAY     ; BL = 4
MUL BL             ; AX = 2 × 4
ADD AL, sutun      ; + 1
MOV SI, AX         ; SI = 9
MOV DL, mat[SI]    ; mat[2][1]
RET
mat DB 11h, 12h, 13h, 14h
    DB 21h, 22h, 23h, 24h
    DB 31h, 32h, 33h, 34h
satir DB 2
sutun DB 1

; YAZMACLAR: AX BL SI DL

; Beklenen cikti:
; AX=0009h
; BL=04h
; SI=0009h
; DL=32h
