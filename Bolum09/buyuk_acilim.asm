; BUYUK MACRO p, q, r / LOCAL ok / MOV AX, p / CMP AX, q / JGE ok / MOV AX, q /
; ok: MOV r, AX / ENDM. Asagidaki kod BUYUK x, y, m1 ve BUYUK y, 4, m2 acilimidir.
; JGE isaretli karsilastirir: m1 = 7, m2 = 4. Sunum 9.1 "BUYUK Makrosu: Kod Izleme".
org 100h
mov ax, x      ; BUYUK x, y, m1
cmp ax, y
jge ??0000
mov ax, y
??0000: mov m1, ax
mov ax, y      ; BUYUK y, 4, m2
cmp ax, 4
jge ??0001
mov ax, 4
??0001: mov m2, ax
ret
x  dw 7
y  dw -3
m1 dw ?
m2 dw ?

; YAZMACLAR: AX SF OF
; BELLEK: m1 2
; BELLEK: m2 2
; Beklenen cikti:
; AX=0004h
; SF=1
; OF=0
; m1: 07h 00h
; m2: 04h 00h
