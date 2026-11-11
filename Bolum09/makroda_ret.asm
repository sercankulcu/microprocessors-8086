; Makroda RET: YAZ MACRO c / MOV AL, c / MOV AH, 0Eh / INT 10h / RET / ENDM.
; Makro CALL ile cagrilmaz; govdedeki RET yigindaki 0000h'yi alir ve PSP:0000'daki
; INT 20h programi bitirir. YAZ 'B' hic calismaz, ekranda yalnizca A vardir.
; Kod iki cagrinin (YAZ 'A', YAZ 'B') acilmis halidir. Sunum 9.1 "Makroda RET: Kod Izleme".
org 100h
mov al, 'A'    ; YAZ 'A'
mov ah, 0Eh
int 10h
ret            ; makronun RET'i
mov al, 'B'    ; YAZ 'B'
mov ah, 0Eh
int 10h
ret
ret

; YAZMACLAR: AX
; Beklenen cikti:
; A
; AX=0E41h
