; Coklamali tarama ile 2026 gosterimi: her hane icin port C (312h = 786) <- 00h, port A
; (310h = 784) <- bolut kodu, port C <- hane secimi. Kodlar 5Bh 3Fh 5Bh 7Dh.
; Kaynak: Bolum 10.2 Aygit Kontrolu, "7 Bölütlü Tarama: Kod İzleme"
; YAZMACLAR: SI AL

org 100h
mov bx, offset kod
mov si, 0
hane:
mov dx, 312h  ; port C (hane)
mov al, 0
out dx, al    ; tümü sönük
mov al, rakam[si]
xlat          ; bölüt kodu
mov dx, 310h  ; port A (bölüt)
out dx, al
mov al, secim[si]
mov dx, 312h
out dx, al    ; tek hane yanar
inc si
cmp si, 4
jb  hane
ret
kod   db 3Fh,06h,5Bh,4Fh,66h
      db 6Dh,7Dh,07h,7Fh,6Fh
rakam db 2, 0, 2, 6
secim db 01h, 02h, 04h, 08h

; Beklenen cikti:
; OUT 786 <- 00h
; OUT 784 <- 5Bh
; OUT 786 <- 01h
; OUT 786 <- 00h
; OUT 784 <- 3Fh
; OUT 786 <- 02h
; OUT 786 <- 00h
; OUT 784 <- 5Bh
; OUT 786 <- 04h
; OUT 786 <- 00h
; OUT 784 <- 7Dh
; OUT 786 <- 08h
; SI=0004h
; AL=08h
