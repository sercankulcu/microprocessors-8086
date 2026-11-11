; Iki sayinin toplami: birinci sayi BX'e saklanir, ikinci SCAN_NUM da CX'e yazar;
; isaretli toplam tasarsa (JO) '?' yazilir. Girdi 120 ve -45 -> 75 (slayttaki tablo:
; -7, -8 -> -15; 30000, 5000 -> ?). Sunum 9.2 "Ornek: Iki Sayinin Toplami".
include 'emu8086.inc'
ORG  100h
CALL scan_num     ; 1. sayı → CX
MOV  BX, CX       ; sakla
PUTC 13
PUTC 10           ; alt satır
CALL scan_num     ; 2. sayı → CX
PUTC 13
PUTC 10
MOV  AX, BX
ADD  AX, CX       ; işaretli toplam
JO   tasma
CALL print_num
RET
tasma: PUTC '?'
RET
DEFINE_SCAN_NUM
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
END

; GIRDI: "120\r-45\r"
; Beklenen cikti:
; 120
; -45
; 75
