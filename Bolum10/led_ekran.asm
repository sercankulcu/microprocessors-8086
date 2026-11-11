; LED ekran (port 199): sozcuk isaretli onluk sayi olarak gosterilir. 1234 = 04D2h,
; -5678 = E9D2h, sonra sonsuz dongude 0, 1, 2, ... yazilir (alttaki HLT'ye hic ulasilmaz).
; Kaynak: Bolum 10.2 Aygit Kontrolu, "LED Ekran Programı"
; SINIR: 13
; YAZMACLAR: AX

#start=led_display.exe#
ORG 100h           ; sunumda yok
mov ax, 1234
out 199, ax
mov ax, -5678
out 199, ax
; port'a sonsuz döngüde yaz:
mov ax, 0
x1:
out 199, ax
inc ax
jmp x1
hlt              ; hiç çalışmaz

; Beklenen cikti:
; OUT 199 <- 04D2h
; OUT 199 <- E9D2h
; OUT 199 <- 0000h
; OUT 199 <- 0001h
; OUT 199 <- 0002h
; AX=0003h
