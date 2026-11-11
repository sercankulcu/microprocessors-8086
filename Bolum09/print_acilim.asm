; PRINT 'OK' makrosunun acilimi: dizgi kodun arasina gomulur, JMP uzerinden atlar,
; CS:[SI] ile okunur. Sunum 9.1 "PRINT Makrosu Acilimi: Kod Izleme".
org 100h
push ax          ; PRINT 'OK'
push si
jmp  ??0003      ; veriyi atla
??0001 db 'OK', 0
??0003: lea si, ??0001
??0000: mov al, cs:[si]
cmp  al, 0
jz   ??0002
inc  si
mov  ah, 0Eh
int  10h
jmp  ??0000
??0002: pop si
pop  ax
ret

; YAZMACLAR: AX SI
; Beklenen cikti:
; OK
; AX=0000h
; SI=0000h
