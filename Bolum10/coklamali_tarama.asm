; Coklamali tarama: dort hanenin bolut uclari ortak port A'da (310h = 784), hane secimi
; port C'de (312h = 786). Her hane icin once tum haneler sondurulur, bolut kodu yazilir, sonra
; yalniz o hane yakilir ve bekle_4ms (CX = 1000 tur LOOP) beklenir; 1234 surekli taranir.
; SINIR tam bir taramayi kapsar (her hane 11 + 1 + 1 + 1000 + 1 + 3 = 1017 komut).
; Kaynak: Bolum 10.2 Aygit Kontrolu, "Gösterge Tablosu ve Tarama" (ikinci parca)
; SINIR: 4000

ORG 100h          ; sunumda yok
tara:
mov si, 0
hane:
mov dx, 312h      ; port C: hane seçimi
mov al, 0
out dx, al        ; önce tüm haneler sönük
mov al, rakam[si]
mov bx, offset kod   ; soldaki tablo
xlat
mov dx, 310h      ; port A: bölütler
out dx, al
mov al, secim[si] ; 01h, 02h, 04h, 08h
mov dx, 312h
out dx, al        ; yalnız bu hane yanar
call bekle_4ms
inc si
cmp si, 4
jb  hane
jmp tara
bekle_4ms:         ; ≈ 4 ms gecikme
mov cx, 1000
loop $
ret
rakam db 1, 2, 3, 4
secim db 01h, 02h, 04h, 08h
kod db 3Fh,06h,5Bh,4Fh,66h   ; sunumda yok: ilk parcadaki (soldaki) tablo
    db 6Dh,7Dh,07h,7Fh,6Fh   ; sunumda yok

; Beklenen cikti:
; OUT 786 <- 00h
; OUT 784 <- 06h
; OUT 786 <- 01h
; OUT 786 <- 00h
; OUT 784 <- 5Bh
; OUT 786 <- 02h
; OUT 786 <- 00h
; OUT 784 <- 4Fh
; OUT 786 <- 04h
; OUT 786 <- 00h
; OUT 784 <- 66h
; OUT 786 <- 08h
