; ADC ile 32 bitlik toplama: 0001FFFFh + 00020001h = 00040000h (DX:AX).
; Kaynak: Bölüm 6 sunumu, "ADC ile Çok Sözcüklü Toplama".
; YAZMACLAR: DX AX CF
org 100h        ; sunumda yok: .COM programı
; DX:AX = 0001FFFFh, CX:BX = 00020001h
mov ax, 0FFFFh
mov dx, 0001h
mov bx, 0001h
mov cx, 0002h
add ax, bx      ; düşük sözcükler
adc dx, cx      ; yüksek + CF
ret             ; sunumda yok: programı bitir

; Beklenen cikti:
; DX=0004h
; AX=0000h
; CF=0
