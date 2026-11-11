; Ic ice makrolar: PRINT2 govdesinde PUTC kullanir; tek satirlik cagri 10 komut uretir.
; Sunum 9.1 "Ic Ice Makrolar".
include 'emu8086.inc'    ; sunumda yok: PUTC tanimi

PRINT2 MACRO c1, c2
       PUTC c1
       PUTC c2
ENDM

ORG 100h                 ; sunumda yok
PRINT2 'O', 'K'
RET                      ; sunumda yok

; Beklenen cikti:
; OK
