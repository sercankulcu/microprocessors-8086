; JNC, JNB ve JAE aynı komuttur (73h): üçü de CF = 0 iken atlar.
; Başlangıçta CF = 0 olduğundan ilk JNC a'ya atlar, AX = 5 olur.
; Sunum: Bölüm 7 Akış Kontrolü, slayt "Eş Anlamlı Atlamalar".
org 100h
jnc a          ; 0100h: 73 07
jnb a          ; 0102h: 73 05
jae a          ; 0104h: 73 03
mov ax, 4      ; 0106h: B8 04 00
a: mov ax, 5   ; 0109h: B8 05 00
ret            ; 010Ch: C3

; YAZMACLAR: AX
; BELLEK: a 4
; Beklenen cikti:
; AX=0005h
; a: B8h 05h 00h C3h
