; Makro kutuphanesi: include ile emu8086.inc'deki GOTOXY, PRINT, PUTC kullanilir.
; Sunum 9.1 "Makro Kutuphaneleri".
include 'emu8086.inc'
ORG 100h
    GOTOXY 10, 5
    PRINT 'Merhaba'
    PUTC  '!'
    RET

; Beklenen cikti:
;
;
;
;
;
;           Merhaba!
