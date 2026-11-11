; Gercek unipolar step motor, 8255 port A (310h = 784): yarim adim dizisi 01h 03h 02h 06h
; 04h 0Ch 08h 09h. adim = 0'dan baslar, INC ile ilk OUT yarim[1] = 03h; AND BX, 7 dizini 0-7'de
; tutar. bekle (CX = 2500 tur LOOP, ~10 ms) adim araligini, yani hizi belirler.
; Sonsuz dongu: her adim ~2510 komut; SINIR ilk uc adimi gosterir.
; Kaynak: Bolum 10.2 Aygit Kontrolu, "Gerçek Motor Dizileri"
; SINIR: 6000
; BELLEK: adim 2

ORG 100h         ; sunumda yok
; 82h ile port A çıkış yapılmış olsun
ileri:
inc adim         ; geri için: dec adim
mov bx, adim
and bx, 7        ; dizin 0–7
mov al, yarim[bx]
mov dx, 310h     ; port A
out dx, al
call bekle       ; adım aralığı = hız
jmp ileri
bekle:           ; ≈ 10 ms gecikme
mov cx, 2500
loop $
ret
yarim db 01h,03h,02h,06h
      db 04h,0Ch,08h,09h
adim  dw 0

; Beklenen cikti:
; OUT 784 <- 03h
; OUT 784 <- 02h
; OUT 784 <- 06h
; adim: 03h 00h
