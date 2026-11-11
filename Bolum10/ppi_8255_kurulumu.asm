; 8255 PPI: kontrol sozcugu 82h (A cikis, B giris, C cikis, mod 0), port B'deki anahtarlari
; okuyup port A'daki LED'lere yazma, BSR sozcugu 0Fh ile PC7 = 1.
; Port adresleri: A = 310h (784), B = 311h (785), kontrol = 313h (787). Anahtarlar 96h.
; Kaynak: Bolum 10.2 Aygit Kontrolu, "8255 Kontrol Sözcüğü" ve "8255 Kurulumu: Kod İzleme"
; PORT 785: 96h
; YAZMACLAR: AL DX

org 100h
mov dx, 313h   ; kontrol yazmacı
mov al, 82h    ; A,C çık; B gir
out dx, al
mov dx, 311h   ; port B
in  al, dx     ; anahtarları oku
mov dx, 310h   ; port A
out dx, al     ; LED'lere yaz
mov dx, 313h
mov al, 0Fh    ; BSR: PC7 = 1
out dx, al
ret

; Beklenen cikti:
; OUT 787 <- 82h
; OUT 784 <- 96h
; OUT 787 <- 0Fh
; AL=0Fh
; DX=0313h
