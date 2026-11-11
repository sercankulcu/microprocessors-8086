; INCLUDE sonrasi kaynak: include satiri kutuphane metniyle degisir; makro tanimlari
; yalnizca sablondur (0 bayt), kod PUTC 'A'nin kullanildigi yerde olusur (8 bayt).
; Sunum 9.2 "INCLUDE Sonrasi Kaynak" (slayttaki "..." govdeli sablonlarin yerine
; include satiri kullanildi).
include 'emu8086.inc'    ; sunumda yok: slayt bu satirin yerine konan metni gosterir
; programın kendisi:
ORG  100h
PUTC 'A'            ; burada 8 bayt
RET

; Beklenen cikti:
; A
