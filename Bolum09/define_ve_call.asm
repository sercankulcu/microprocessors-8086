; Prosedur kullanimi: DEFINE_... makrosu proseduru RET ile END arasina acar, kod
; CALL ile kullanir. Ayni bitler: FFE7h = -25 (isaretli) = 65 511 (isaretsiz).
; Sunum 9.2 "Prosedur Kullanimi: DEFINE_ ve CALL" (slayttaki "..." yerine ornek eklendi;
; deger "Sayi Prosedurleri" slaytindan).
include 'emu8086.inc'
ORG 100h
    MOV  AX, -25         ; sunumda yok
    CALL print_num   ; kullan
    PUTC ' '             ; sunumda yok
    CALL print_num_uns   ; sunumda yok
RET

DEFINE_PRINT_NUM    ; tanımla
DEFINE_PRINT_NUM_UNS
END

; Beklenen cikti:
; -25 65511
