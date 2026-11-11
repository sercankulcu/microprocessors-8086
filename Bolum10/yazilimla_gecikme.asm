; Yazilimla gecikme: MOV CX, N / LOOP toplam 17N - 8 saat turu. N = 281 -> 4769 tur, 4,77 MHz
; 8086'da yaklasik 1 ms. Dongu bitince CX = 0.
; Kaynak: Bolum 10.2 Aygit Kontrolu, "Yazılımla Gecikme"
; YAZMACLAR: CX

ORG 100h       ; sunumda yok
; ≈ 1 ms gecikme (4,77 MHz 8086)
mov cx, 281    ; 4 tur
bekle:
loop bekle     ; 280 × 17 + 1 × 5 tur
ret            ; sunumda yok

; Beklenen cikti:
; CX=0000h
