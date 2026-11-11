; Makrolarla ekran: PRINT, GOTOXY ve PUTC (sayi ya da karakter sabiti).
; Sunum 9.2 "Ornek: Makrolarla Ekran" (ve "Kod Izleme: PRINT, GOTOXY, PUTC").
include emu8086.inc
ORG    100h
PRINT 'Hello World!'
GOTOXY 10, 5
PUTC 65           ; 65 - is an ASCII code for 'A'
PUTC 'B'
RET               ; return to operating system.
END               ; directive to stop the compiler.

; Beklenen cikti:
; Hello World!
;
;
;
;
;           AB
