; AAS: paketsiz BCD çıkarmadan sonra düzeltme. 5 - 8 = FDh → AL = 7, AH'den 1 ödünç
; (15 - 8 gibi), CF = 1.
; Kaynak: Bölüm 6 sunumu, "AAS: Çıkarma Sonrası Düzeltme".
; GIRDI: " "
org 100h        ; sunumda yok: .COM programı
; make 5 - 8, al = 0fdh (not in bcd form)
mov     al, 05h
mov     bl, 08h
sub     al, bl
; convert to bcd, al = 7
; and 1 is borrowed from ah,
; like calculating 15 - 8:
aas
; --- yazdır ---
or      al, 30h
mov     ah, 0Eh
int     10h
mov     ah, 0
int     16h
ret

; Beklenen cikti:
; 7
