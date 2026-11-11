; Adres başa sarar: FFFF:0510 = FFFF0h + 0510h = 100500h; 8086'nın 20 adres hattı
; 21. biti atar ve 00500h'ye erişir. 0000:0500'e yazılan 77h, FFFF:0510'dan okunur.
; Kaynak: Bölüm 2.1 8086 Mimarisi, "Adres Başa Sarar: Kod İzleme"

org 100h
mov ax, 0
mov ds, ax
mov byte ptr [0500h], 77h
mov ax, 0FFFFh
mov ds, ax
mov bl, [0510h]    ; FFFF:0510
ret

; YAZMACLAR: BL

; Beklenen cikti (gerçek 8086):
; BL=77h
