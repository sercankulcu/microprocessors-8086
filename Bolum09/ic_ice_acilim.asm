; PRINT2 'O', 'K' acilimi: 1. duzeyde iki PUTC, 2. duzeyde PUTC'lerin govdesi.
; Iki duzey ayni isi yapar; burada arka arkaya calistirildigi icin OK iki kez yazilir.
; Sunum 9.1 "Ic Ice Makrolar" (acilim slaytlari).
include 'emu8086.inc'    ; sunumda yok: 1. duzeydeki PUTC tanimi
ORG 100h                 ; sunumda yok
; 1. düzey: PRINT2 açılır
PUTC 'O'
PUTC 'K'
; 2. düzey: PUTC'ler açılır
push ax
mov  al, 'O'
mov  ah, 0eh
int  10h
pop  ax
push ax
mov  al, 'K'
mov  ah, 0eh
int  10h
pop  ax
RET                      ; sunumda yok

; Beklenen cikti:
; OKOK
