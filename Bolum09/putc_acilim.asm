; PUTC 'A' ve PUTC 'B' acilimi: 2 kopya x 8 bayt + RET = 17 bayt; AX bozulmaz.
; Sunum 9.1 "PUTC Calisirken".
ORG  100h
push ax          ; PUTC 'A'
mov  al, 'A'
mov  ah, 0eh
int  10h
pop  ax
push ax          ; PUTC 'B'
mov  al, 'B'
mov  ah, 0eh
int  10h
pop  ax
RET

; YAZMACLAR: AX
; Beklenen cikti:
; AB
; AX=0000h
