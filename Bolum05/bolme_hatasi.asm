; Kendi INT 0 (bölme hatası) yordamımızı kurmak: DIV BL, BL = 0 iken INT 0 üretir,
; yordam AX = FFFFh işaretini bırakır, IRET DIV'den sonraki komuta döner.
; Kaynak: Bölüm 5.1 sunumu, "Bölme Hatası: Kod İzleme".
; 8086'da (ve emu8086'da) INT 0 yığına DIV'den sonraki komutun adresini iter (80286 ve
; sonrası DIV'in kendi adresini iter); sonuç: AX = FFFFh, DL = FFh.
; YAZMACLAR: AX DL
org 100h
mov ax, 0
mov es, ax           ; ES = 0: IVT
mov word ptr es:[0*4], offset hata
mov word ptr es:[0*4+2], cs
mov ax, 100
mov bl, 0
div bl               ; INT 0!
mov dl, al           ; dönüş buraya
ret
hata:
mov ax, 0FFFFh       ; hata işareti
iret

; Beklenen cikti:
; AX=FFFFh
; DL=FFh
