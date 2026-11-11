; SBB ile 32 bitlik çıkarma: 00040000h - 00010001h = 0002FFFFh (DX:AX).
; Kaynak: Bölüm 6 sunumu, "SBB ile 32 Bitlik Çıkarma".
; YAZMACLAR: DX AX CF
org 100h        ; sunumda yok: .COM programı
; DX:AX = 00040000h, CX:BX = 00010001h
mov ax, 0000h
mov dx, 0004h
mov bx, 0001h
mov cx, 0001h
sub ax, bx      ; düşük sözcükler
sbb dx, cx      ; yüksek - CF
ret             ; sunumda yok: programı bitir

; Beklenen cikti:
; DX=0002h
; AX=FFFFh
; CF=0
