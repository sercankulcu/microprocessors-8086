; Gecikme dongusunde saat turu sayma: MOV CX, 4 (4 tur) + 3 x LOOP atlar (17) + LOOP cikar (5)
; = 60 tur. Emulator zamanlamayi olcmez; yalniz CX'in 0'a indigi dogrulanir.
; Kaynak: Bolum 10.2 Aygit Kontrolu, "Gecikme Döngüsü: Kod İzleme"
; YAZMACLAR: CX

org 100h
mov cx, 4      ; 4 saat turu
bekle:
loop bekle     ; 17 tur, sonuncu 5
ret

; Beklenen cikti:
; CX=0000h
