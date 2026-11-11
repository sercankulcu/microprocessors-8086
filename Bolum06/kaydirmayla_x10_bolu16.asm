; Kaydırmayla × 10 (= × 8 + × 2) ve ÷ 16 (SHR 4, kalan AND 0Fh): 37 × 10 = 370 = 0172h,
; 370 / 16 = 23 (0017h) kalan 2. 8086'da kaydırma sayısı 1 ya da CL'dir.
; Kaynak: Bölüm 6 sunumu, "Kaydırmayla ×10 ve ÷16: Kod İzleme".
; YAZMACLAR: AX BX
org 100h
mov ax, 37
shl ax, 1      ; AX × 2
mov bx, ax     ; sakla
shl ax, 1      ; AX × 4
shl ax, 1      ; AX × 8
add ax, bx     ; ×8 + ×2
mov bx, ax
and bx, 000Fh  ; kalan: alt 4 bit
mov cl, 4
shr ax, cl     ; bölüm: ÷ 16
ret

; Beklenen cikti:
; AX=0017h
; BX=0002h
