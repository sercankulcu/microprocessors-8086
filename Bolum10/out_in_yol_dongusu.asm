; OUT 59h, AL ve IN AL, 9Ah: her biri bir komut getirme ve bir G/C yol dongusu. Tek port
; adresi (59h) yuksek bankayi, cift port adresi (9Ah) dusuk bankayi kullanir.
; Izlemede AL = 12h yazilir, port 9Ah 3Ch dondurur.
; Kaynak: Bolum 10.1 8086 Pinleri, "Komuttan Yol Döngülerine: OUT ve IN"
; (slayttaki CS = 01A7h ve adres/bayt sutunlari burada yok; komut baytlari ayni: E6 59, E4 9A)
; PORT 154: 3Ch
; YAZMACLAR: AL

ORG 100h           ; sunumda yok
mov al, 12h        ; sunumda yok: ; CS = 01A7h, AL = 12h
out 59h, al
in  al, 9Ah
ret                ; sunumda yok

; Beklenen cikti:
; OUT 89 <- 12h
; AL=3Ch
