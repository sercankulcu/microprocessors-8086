; Cerceveli baslik: CLEAR_SCREEN, GOTOXY ve PRINT kutuphaneden, cizgi kendi prosedurumuz.
; Dongudeki PUTC '-' bir kez acilir, 10 kez calisir. Sunum 9.2 "Ornek: Cerceveli Baslik".
include 'emu8086.inc'
ORG  100h
CALL clear_screen
GOTOXY 10, 2
CALL cizgi
GOTOXY 10, 3
PRINT '|  BASLIK  |'
GOTOXY 10, 4
CALL cizgi
GOTOXY 0, 6       ; imleç alta
RET
cizgi PROC        ; +----------+
PUTC '+'
MOV  CX, 10
tire: PUTC '-'
LOOP tire
PUTC '+'
RET
cizgi ENDP
DEFINE_CLEAR_SCREEN
END

; Beklenen cikti:
;
;
;           +----------+
;           |  BASLIK  |
;           +----------+
