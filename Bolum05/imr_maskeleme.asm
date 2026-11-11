; 8259A IMR'si (port 21h) ile yalnız IRQ1'i (klavye) maskeleyip sonra açmak:
; oku-değiştir-yaz kalıbı, OR ile maskele, AND ile aç.
; IMR'nin örnek değeri sunumdaki gibi B8h; ikinci IN, yazılan BAh'yi okur.
; Kaynak: Bölüm 5.1 sunumu, "IMR ile Maskeleme: Kod İzleme".
; PORT 33: B8h BAh
; YAZMACLAR: AL
org 100h
in al, 21h           ; IMR'yi oku
or al, 00000010b     ; IRQ1 maskele
out 21h, al
mov cx, 3            ; kritik iş
in al, 21h
and al, 11111101b    ; IRQ1 aç
out 21h, al
ret

; Beklenen cikti:
; OUT 33 <- BAh
; OUT 33 <- B8h
; AL=B8h
