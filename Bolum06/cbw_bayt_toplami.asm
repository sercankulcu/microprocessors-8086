; İşaretli baytları CBW ile 16 bite genişletip toplamak: 100 - 30 + 90 - 7 = 153 = 0099h.
; Kaynak: Bölüm 6 sunumu, "CBW ile İşaretli Bayt Toplamı".
; BELLEK: toplam 2
org 100h
jmp basla
dizi db 100, -30, 90, -7
toplam dw 0
basla:
lea si, dizi
mov cx, 4
xor bx, bx      ; BX = 16 bit toplam
dongu:
mov al, [si]
cbw             ; AL -> AX (işaretle)
add bx, ax
inc si
loop dongu
mov toplam, bx  ; 153 = 0099h
ret

; Beklenen cikti:
; toplam: 99h 00h
