; GET_STRING klavyeden DS:DI tamponuna (DX = boyut) 0 ile biten dizgi okur;
; CLEAR_SCREEN ekrani siler ve imleci (0, 0)'a alir; dizgi PRINT_STRING ile yazilir.
; Sunum 9.2 "GET_STRING ve CLEAR_SCREEN".
include 'emu8086.inc'    ; sunumda yok
ORG 100h                 ; sunumda yok
LEA  DI, ad          ; tampon
MOV  DX, 20          ; boyut
CALL get_string
CALL clear_screen
LEA  SI, ad
CALL print_string
RET
ad DB 20 DUP(0)
DEFINE_GET_STRING        ; sunumda yok
DEFINE_CLEAR_SCREEN      ; sunumda yok
DEFINE_PRINT_STRING      ; sunumda yok

; GIRDI: "Ece\r"
; BELLEK: ad 4
; Beklenen cikti:
; Ece
; ad: 45h 63h 65h 00h
