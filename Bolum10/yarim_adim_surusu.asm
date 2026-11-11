; Gercek unipolar step motor, 8255 port A (310h = 784): yarim adim dizisi 01h 03h 02h 06h
; 04h 0Ch 08h 09h. adim = 6'dan baslar: ilk OUT yarim[7] = 09h, sonra dizi basa sarar.
; AND BX, 7 dizini 0-7'de tutar. Sonsuz dongu: SINIR ilk birkac adimi gosterir.
; Kaynak: Bolum 10.2 Aygit Kontrolu, "Yarım Adım Sürüşü: Kod İzleme"
; ("Gerçek Motor Dizileri" slaytindaki ayni kod, orada adim dw 0 ve tablo basta)
; SINIR: 27
; YAZMACLAR: BX AL
; BELLEK: adim 2

org 100h
ileri:
inc adim         ; geri: dec adim
mov bx, adim
and bx, 7        ; dizin 0–7
mov al, yarim[bx]
mov dx, 310h     ; port A
out dx, al
call bekle       ; adım aralığı
jmp ileri
bekle: ret       ; (gecikme)
yarim db 01h,03h,02h,06h
      db 04h,0Ch,08h,09h
adim  dw 6

; Beklenen cikti:
; OUT 784 <- 09h
; OUT 784 <- 01h
; OUT 784 <- 03h
; BX=0001h
; AL=03h
; adim: 09h 00h
