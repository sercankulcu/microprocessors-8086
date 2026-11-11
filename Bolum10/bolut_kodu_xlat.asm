; 7 bolutlu gosterge: rakami (0-9) XLAT ile ortak katot bolut koduna cevirip 8255 port A'ya
; (310h = 784) yazma. '3' -> 4Fh.
; Kaynak: Bolum 10.2 Aygit Kontrolu, "Gösterge Tablosu ve Tarama" (ilk parca)
; YAZMACLAR: AL

ORG 100h           ; sunumda yok
; rakamı (0–9) bölüt koduna çevir
mov bx, offset kod
mov al, 3        ; rakam
xlat              ; AL = [BX + AL] = 4Fh
; not al          ; ortak anot ise
mov dx, 310h     ; 8255 port A
out dx, al
ret
kod db 3Fh,06h,5Bh,4Fh,66h
    db 6Dh,7Dh,07h,7Fh,6Fh

; Beklenen cikti:
; OUT 784 <- 4Fh
; AL=4Fh
