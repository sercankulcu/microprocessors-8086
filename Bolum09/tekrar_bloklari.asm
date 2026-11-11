; Tekrar bloklari: REPT 3 -> uc kez SHL AX, 1 (AX x 8); IRP -> PUSH AX, PUSH BX, PUSH CX;
; IRPC -> PUTC 'O', PUTC 'K'. Sunum 9.1 "Tekrar Bloklari" (uc slayt).
include 'emu8086.inc'    ; sunumda yok: PUTC tanimi
ORG 100h                 ; sunumda yok
MOV AX, 1                ; sunumda yok
REPT 3
  SHL AX, 1
ENDM
MOV BX, 2                ; sunumda yok
MOV CX, 3                ; sunumda yok
IRP r, <AX,BX,CX>
  PUSH r
ENDM
POP DX                   ; sunumda yok: son itilen CX
POP SI                   ; sunumda yok: BX
POP DI                   ; sunumda yok: AX
IRPC c, OK
  PUTC '&c'
ENDM
RET                      ; sunumda yok

; YAZMACLAR: AX DX SI DI
; Beklenen cikti:
; OK
; AX=0008h
; DX=0003h
; SI=0002h
; DI=0008h
