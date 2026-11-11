; PRINTN yazip alt satira gecer; CURSOROFF / CURSORON imleci gizler / gosterir
; (INT 10h, AH = 01h). Sunum 9.2 "PRINTN ve Imlec Makrolari".
include 'emu8086.inc'    ; sunumda yok
ORG 100h                 ; sunumda yok
PRINTN 'Ad Soyad:'   ; yazıp alt satıra geç
CURSOROFF
GOTOXY 30, 12
PRINT 'Merhaba'
CURSORON
RET                      ; sunumda yok

; Beklenen cikti:
; Ad Soyad:
;
;
;
;
;
;
;
;
;
;
;
;                               Merhaba
