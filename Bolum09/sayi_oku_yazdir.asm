; Sayi oku ve yazdir: PRINT_STRING ile soru, SCAN_NUM ile sayi (CX), PTHIS ile ileti,
; PRINT_NUM ile isaretli sonuc. Girdi -25 -> CX = FFE7h.
; Sunum 9.2 "Ornek: Sayi Oku ve Yazdir".
include 'emu8086.inc'
ORG    100h
LEA    SI, msg1       ; ask for the number
CALL   print_string   ;
CALL   scan_num       ; get number in CX.
MOV    AX, CX         ; copy the number to AX.
CALL   pthis          ; print the following string:
DB  13, 10, 'You have entered: ', 0
CALL   print_num      ; print number in AX.
RET                   ; return to operating system.
msg1   DB  'Enter the number: ', 0
DEFINE_SCAN_NUM
DEFINE_PRINT_STRING
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS  ; required for print_num.
DEFINE_PTHIS
END                   ; directive to stop the compiler.

; GIRDI: "-25\r"
; YAZMACLAR: CX
; Beklenen cikti:
; Enter the number: -25
; You have entered: -25
; CX=FFE7h
