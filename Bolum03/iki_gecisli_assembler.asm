; Assembler'ın iki geçişi: 1. geçişte mesaj = 010Ch sembol tablosuna girer, 2. geçişte
; baytlar üretilir: B4 09 BA 0C 01 CD 21 B8 00 4C CD 21 4D 65 72 68 61 62 61 21 24.
; 21 baytlık COM dosyası ekrana Merhaba! yazar.
; Kaynak: Bölüm 3.1 Programlama Dilleri, "Assembler'ın İki Geçişi: Adım Adım"
; (aynı kod "Çevirme ve Bağlama" slaytındaki listeleme tablosunda da geçer)

kod EQU 0100h     ; sunumda yok: BELLEK yönergesi için kodun başı

org 100h
mov ah, 09h
mov dx, offset mesaj
int 21h
mov ax, 4C00h
int 21h
mesaj db 'Merhaba!$'

; BELLEK: kod 21

; Beklenen cikti:
; Merhaba!
; kod: B4h 09h BAh 0Ch 01h CDh 21h B8h 00h 4Ch CDh 21h 4Dh 65h 72h 68h 61h 62h 61h 21h 24h
