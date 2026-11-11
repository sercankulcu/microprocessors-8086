; PUTC 'A' ve GOTOXY 10, 5 neye genisler: PUTC 5 komut / 8 bayt, GOTOXY AX, BX, DX'i
; korur ve INT 10h AH = 02h ile imleci tasir (DH = satir, DL = sutun).
; Sunum 9.2 "PUTC ve GOTOXY Neye Genisler?" (iki slayt).
ORG  100h      ; sunumda yok
PUSH AX        ; AX'i koru
MOV  AL, 'A'   ; parametre
MOV  AH, 0Eh   ; teletype
INT  10h
POP  AX        ; AX geri

PUSH AX
PUSH BX
PUSH DX
MOV  AH, 02h   ; imleç konumla
MOV  DH, 5     ; satır (row)
MOV  DL, 10    ; sütun (col)
MOV  BH, 0     ; sayfa 0
INT  10h
POP  DX
POP  BX
POP  AX

MOV  AH, 0Eh   ; sunumda yok: imlecin yeni yerini gostermek icin 'B' yaz
MOV  AL, 'B'   ; sunumda yok
INT  10h       ; sunumda yok
RET            ; sunumda yok

; Beklenen cikti:
; A
;
;
;
;
;           B
