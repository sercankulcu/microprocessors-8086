; Dizgi prosedurleri: PRINT_STRING dizginin adresini DS:SI'dan alir; PTHIS dizgiyi
; CALL'dan hemen sonra bulur ve donus adresini dizginin sonrasina tasir.
; Sunum 9.2 "Dizgi Prosedurleri" (iki slayt).
include 'emu8086.inc'    ; sunumda yok
ORG 100h                 ; sunumda yok
LEA  SI, msg
CALL print_string
PUTC 13                  ; sunumda yok: alt satira gec
PUTC 10                  ; sunumda yok
CALL pthis
DB 'Merhaba', 0
; buradan devam eder
RET                      ; sunumda yok
msg DB 'Merhaba', 0      ; slaytta CALL print_string'in hemen altinda; calismasin diye RET'ten sonra
DEFINE_PRINT_STRING      ; sunumda yok
DEFINE_PTHIS             ; sunumda yok

; Beklenen cikti:
; Merhaba
; Merhaba
